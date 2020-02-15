#!/bin/sh

docker build -t mediawiki_lightning:latest -f Dockerfile.WithLightningPaymentExtension .
