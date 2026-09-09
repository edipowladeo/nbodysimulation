! Diagnostic only: byte equality remains the regression acceptance criterion.
program compare_numeric
  use iso_fortran_env, only: real64, iostat_end, error_unit
  use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
  implicit none
  character(4096) :: reference_path, candidate_path, argument
  character(16384) :: reference_line, candidate_line
  integer :: reference_unit, candidate_unit, sr, sc, columns, time_column
  integer :: row, j, first_row, first_column, first_time_row, code
  real(real64), allocatable :: reference(:), candidate(:), absolute_max(:), relative_max(:)
  integer, allocatable :: first_by_column(:)
  real(real64) :: difference, relative

  if (command_argument_count() /= 4) call fail('usage: compare reference candidate columns time_column (0 if absent)')
  call get_command_argument(1, reference_path)
  call get_command_argument(2, candidate_path)
  call get_command_argument(3, argument)
  read(argument, *, iostat=code) columns
  if (code /= 0) call fail('invalid column count')
  if (columns < 1 .or. columns > 15) call fail('unsupported column count')
  call get_command_argument(4, argument)
  read(argument, *, iostat=code) time_column
  if (code /= 0) call fail('invalid time column')
  if (time_column < 0 .or. time_column > columns) call fail('invalid time column')
  allocate(reference(columns), candidate(columns), absolute_max(columns), relative_max(columns), first_by_column(columns))
  absolute_max = 0
  relative_max = 0
  first_by_column = 0
  first_row = 0
  first_column = 0
  first_time_row = 0
  open(newunit=reference_unit, file=trim(reference_path), status='old', action='read', iostat=code)
  if (code /= 0) call fail('cannot open reference')
  open(newunit=candidate_unit, file=trim(candidate_path), status='old', action='read', iostat=code)
  if (code /= 0) call fail('cannot open candidate')
  row = 0
  do
    read(reference_unit, '(A)', iostat=sr) reference_line
    read(candidate_unit, '(A)', iostat=sc) candidate_line
    if (sr == iostat_end .and. sc == iostat_end) exit
    if (sr == iostat_end .or. sc == iostat_end) then
      write(*, '(A,I0)') 'row_count_mismatch_at=', row + 1
      call fail('different row counts; do not assume aligned samples')
    end if
    if (sr /= 0 .or. sc /= 0) call fail('input read error')
    row = row + 1
    call parse_row(reference_line, reference, row, 'reference')
    call parse_row(candidate_line, candidate, row, 'candidate')
    if (time_column > 0) then
      if (reference(time_column) /= candidate(time_column) .and. first_time_row == 0) first_time_row = row
    end if
    do j = 1, columns
      difference = abs(candidate(j) - reference(j))
      if (.not. ieee_is_finite(difference)) call fail('absolute error overflow')
      relative = 0
      if (reference(j) /= 0) then
        relative = difference / abs(reference(j))
        if (.not. ieee_is_finite(relative)) call fail('relative error overflow')
      end if
      absolute_max(j) = max(absolute_max(j), difference)
      relative_max(j) = max(relative_max(j), relative)
      if (difference /= 0) then
        if (first_by_column(j) == 0) first_by_column(j) = row
        if (first_row == 0) then
          first_row = row
          first_column = j
        end if
      end if
    end do
  end do
  close(reference_unit)
  close(candidate_unit)
  if (row == 0) call fail('empty input')
  write(*, '(A,I0)') 'rows=', row
  write(*, '(A,I0)') 'first_different_row=', first_row
  write(*, '(A,I0)') 'first_different_column=', first_column
  write(*, '(A,I0)') 'first_different_time_row=', first_time_row
  if (time_column == 0) write(*, '(A)') 'time_alignment=unavailable_in_this_file'
  if (first_time_row /= 0) write(*, '(A)') 'WARNING: time grids differ; errors below compare row indices only'
  write(*, '(A)') 'relative errors exclude zero references; inspect absolute errors for those samples'
  write(*, '(A)') 'column first_different_row max_absolute_error max_relative_error_nonzero_reference'
  do j = 1, columns
    write(*, '(I0,1X,I0,2(1X,ES24.16E3))') j, first_by_column(j), absolute_max(j), relative_max(j)
  end do
  if (first_row /= 0) stop 1
contains
  subroutine fail(message)
    character(*), intent(in) :: message
    write(error_unit, '(A)') trim(message)
    stop 2
  end subroutine

  subroutine parse_row(line, values, row_number, side)
    character(*), intent(in) :: line, side
    real(real64), intent(out) :: values(:)
    integer, intent(in) :: row_number
    integer :: start, finish, n, length, status
    length = len_trim(line)
    if (length == len(line)) call fail('row exceeds diagnostic buffer')
    start = 1
    n = 0
    do while (start <= length)
      if (line(start:start) == ' ' .or. line(start:start) == achar(9)) then
        start = start + 1
        cycle
      end if
      finish = start
      do while (finish <= length)
        if (line(finish:finish) == ' ' .or. line(finish:finish) == achar(9)) exit
        finish = finish + 1
      end do
      n = n + 1
      if (n > size(values)) call fail('too many columns')
      ! Reject list-directed separators, repetition and null-value syntax.
      if (verify(line(start:finish-1), '0123456789+-.eEdD') /= 0) call fail('invalid numeric token')
      read(line(start:finish-1), *, iostat=status) values(n)
      if (status /= 0) then
        write(error_unit, '(A,1X,I0,1X,I0)') side, row_number, n
        call fail('invalid number')
      end if
      if (.not. ieee_is_finite(values(n))) call fail('nonfinite number')
      start = finish
    end do
    if (n /= size(values)) call fail('wrong column count')
  end subroutine
end program
