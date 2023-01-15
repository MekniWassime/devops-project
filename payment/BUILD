python_sources()

docker_image(
    name="payment_container",
    dependencies=[
        ":payment_poetry",
        ":payment_django_manage",
    ]
)

poetry_requirements(
    name="payment_poetry",
)

pex_binary(
    name="payment_django_manage",
    entry_point="manage.py",
)
