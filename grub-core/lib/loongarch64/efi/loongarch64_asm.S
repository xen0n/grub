/*
 *  GRUB  --  GRand Unified Bootloader
 *  Copyright (C) 2017  Free Software Foundation, Inc.
 *
 *  GRUB is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  GRUB is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <grub/symbol.h>

	.file 	"loongarch64_asm.S"
	.text

	.align		4

VARIABLE (grub_efi_loongarch64_reset_start)

VARIABLE (grub_efi_loongarch64_reset_system_addr)
	.dword		0

reset_system:
	move		$a1, $zero
	move		$a2, $zero
	move		$a3, $zero
	la		$t8, grub_efi_loongarch64_reset_system_addr
	ld.d		$t8, $t8, 0
	jr		$t8

FUNCTION(grub_efi_loongarch64_reset_cold)
	li.w		$a0, 0
	b		reset_system

FUNCTION(grub_efi_loongarch64_reset_warm)
	li.w		$a0, 1
	b		reset_system

FUNCTION(grub_efi_loongarch64_reset_shutdown)
	li.w		$a0, 2
	b		reset_system

FUNCTION(grub_efi_loongarch64_reset_suspend)
	li.w		$a0, 3
	b		reset_system

VARIABLE (grub_efi_loongarch64_reset_end)


