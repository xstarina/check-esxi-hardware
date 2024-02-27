FROM alpine:latest AS base

RUN set -ex; \
    apk add --update --no-cache python3; \
    addgroup -g 7777 -S dude; \
    adduser -u 7777 -h / -SD -G dude dude;

WORKDIR /app/

# ----------

FROM base AS build

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN set -ex; \
    python -m venv venv; \
    . venv/bin/activate; \
    pip install --no-cache-dir pywbem;

# ----------

FROM base AS final

COPY --from=build /app/venv/ ./venv/
RUN set -ex; \
    wget https://raw.githubusercontent.com/Napsty/check_esxi_hardware/master/check_esxi_hardware.py; \
    chown -R dude:dude .;

ENV PATH="/app/venv/bin:$PATH"
USER dude

LABEL org.opencontainers.image.title=check-esxi-hardware \
      org.opencontainers.image.description="Script to monitor the hardware of ESXi" \
      org.opencontainers.image.vendor=starina

ENTRYPOINT [ "python", "check_esxi_hardware.py" ]
