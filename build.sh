#!/bin/bash

(cd templates && docker compose build) && (cd images && docker compose build);
