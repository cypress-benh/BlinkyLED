/***************************************************************************//**
* \file main.c
* \version 1.0
*
* \brief
* Demonstrates blinking an LED under firmware control. The Cortex-M4 toggles
* the Red LED. The Cortex-M0+ starts the Cortex-M4 and enters sleep.
*
* Compatible Kits:
*    CY8CKIT-062-BLE
*    CY8CKIT-062-WIFI-BT
*
********************************************************************************
* \copyright
* Copyright 2017-2018, Cypress Semiconductor Corporation. All rights reserved.
* You may use this file only in accordance with the license, terms, conditions,
* disclaimers, and limitations in the end user license agreement accompanying
* the software package with which this file was provided.
*******************************************************************************/

#include "cy_device_headers.h"
#include "cy_syslib.h"
#include "cy_gpio.h"
#include "cycfg_pins.h"

int main(void)
{
    /* enable interrupts */
    __enable_irq();

    /* initialize blue LED */
    Cy_GPIO_Pin_Init(LED_RED_PORT, LED_RED_PIN, &LED_RED_cfg);

    for (;;)
    {
        Cy_GPIO_Inv(LED_RED_PORT, LED_RED_PIN); /* toggle the pin */
        Cy_SysLib_Delay(1000/*msec*/);
    }
}