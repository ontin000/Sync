#!/bin/bash

nitrogen --restore &
killall -SIGUSR1 tint2 &
killall wbar &
wbar &
openbox --reconfigure &
