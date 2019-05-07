#!/bin/bash

julia 'using Registrator; Registrator.RegServer.registrator()' conf.toml &> registrator.log
