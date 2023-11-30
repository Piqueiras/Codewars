#!/bin/bash

(( $1 % 2 == 0)) && echo "Even" || echo "Odd"