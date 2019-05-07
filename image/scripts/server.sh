#!/bin/bash

julia 'using Registrator; Registrator.RegServer.server()' conf.toml &> server.log
