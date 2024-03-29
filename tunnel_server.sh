#!/bin/bash

source .env

ssh -L 30090:localhost:30090 $username@$serverip

