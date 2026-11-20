FROM public.ecr.aws/lambda/python:3.12@sha256:4428def7584f7673df2341e011ef9a4e99e526754842aa2f3602bce7f89dc6c1

# Optional: inject a custom CA certificate (e.g. for SSL inspection proxies).
# Uncomment and replace custom-ca.pem with your certificate bundle before building.
# COPY custom-ca.pem /etc/pki/ca-trust/source/anchors/custom-ca.pem
# RUN update-ca-trust

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY *.py ./

# The Lambda managed runtime executes under its own non-root sandbox UID regardless of
# the USER directive, so omitting USER does not grant root privileges at runtime.  If this
# image is ever run outside Lambda (ECS, local dev, Kubernetes), add a non-root USER
# directive here and verify that the Lambda bootstrap paths remain writable.

CMD ["lambda_function.lambda_handler"]
