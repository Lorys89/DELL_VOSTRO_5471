/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLF6fd4r.aml, Sun Oct  4 22:45:37 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000055B (1371)
 *     Revision         0x02
 *     Checksum         0x78
 *     OEM ID           "HACK"
 *     OEM Table ID     "Dell"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "HACK", "Dell", 0x00000000)
{
    External (_PR_.PR00, ProcessorObj)
    External (_SB_.AC__, DeviceObj)
    External (_SB_.ACOS, IntObj)
    External (_SB_.ACSE, IntObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.XRT6, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.I2C0, DeviceObj)
    External (_SB_.PCI0.I2C0.TPD0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (GPEN, FieldUnitObj)
    External (SBRG, FieldUnitObj)
    External (XPRW, MethodObj)    // 2 Arguments

    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply", 
                    0x13EC, 
                    "kUSBSleepPortCurrentLimit", 
                    0x0834, 
                    "kUSBWakePowerSupply", 
                    0x13EC, 
                    "kUSBWakePortCurrentLimit", 
                    0x0834
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Scope (AC)
        {
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x18, 
                0x03
            })
        }

        Device (PNLF)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
            Name (_CID, "backlight")  // _CID: Compatible ID
            Name (_UID, 0x10)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Scope (PCI0)
        {
            Device (MCHC)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Scope (I2C0)
            {
                Scope (TPD0)
                {
                    If (_OSI ("Darwin"))
                    {
                        Name (OSYS, 0x07DC)
                    }
                }
            }

            Scope (SBUS)
            {
                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (DVL0)
                    {
                        Name (_ADR, 0x57)  // _ADR: Address
                        Name (_CID, "diagsvault")  // _CID: Compatible ID
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            If (!Arg2)
                            {
                                Return (Buffer (One)
                                {
                                     0x57                                             // W
                                })
                            }

                            Return (Package (0x02)
                            {
                                "address", 
                                0x57
                            })
                        }
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Scope (GFX0)
            {
                Method (BRT6, 2, NotSerialized)
                {
                    If (_OSI ("Darwin"))
                    {
                        If ((Arg0 == One))
                        {
                            Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                            Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // Reserved
                        }

                        If ((Arg0 & 0x02))
                        {
                            Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                            Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
                        }
                    }
                    Else
                    {
                        \_SB.PCI0.GFX0.XRT6 (Arg0, Arg1)
                    }
                }
            }

            Scope (RP01)
            {
                OperationRegion (DE01, PCI_Config, 0x50, One)
                Field (DE01, AnyAcc, NoLock, Preserve)
                {
                        ,   1, 
                        ,   3, 
                    DDDD,   1
                }
            }

            Scope (LPCB)
            {
                Scope (PS2K)
                {
                    Name (RMCF, Package (0x02)
                    {
                        "Keyboard", 
                        Package (0x04)
                        {
                            "Custom PS2 Map", 
                            Package (0x04)
                            {
                                Package (0x00){}, 
                                "46=0", 
                                "e045=0", 
                                "e037=64"
                            }, 

                            "Swap command and option", 
                            ">n"
                        }
                    })
                }

                Device (EC)
                {
                    Name (_HID, "ACID0001")  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }
        }
    }

    Scope (\_PR)
    {
        Scope (PR00)
        {
            If (_OSI ("Darwin"))
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x02)
                    {
                        "plugin-type", 
                        One
                    })
                }
            }
        }
    }

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPEN = One
            SBRG = One
            \_SB.ACOS = 0x80
            \_SB.ACSE = One
            \_SB.PCI0.RP01.DDDD = One
        }
    }

    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If ((0x6D == Arg0))
            {
                Return (Package (0x02)
                {
                    0x6D, 
                    Zero
                })
            }

            If ((0x0D == Arg0))
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }
        }

        Return (XPRW (Arg0, Arg1))
    }

    Method (DTGP, 5, NotSerialized)
    {
        If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
        {
            If ((Arg1 == One))
            {
                If ((Arg2 == Zero))
                {
                    Arg4 = Buffer (One)
                        {
                             0x03                                             // .
                        }
                    Return (One)
                }

                If ((Arg2 == One))
                {
                    Return (One)
                }
            }
        }

        Arg4 = Buffer (One)
            {
                 0x00                                             // .
            }
        Return (Zero)
    }
}

