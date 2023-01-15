python_sources()

docker_image(
    name="product_container",
    dependencies=[
        ":poetry",
        ":django_manage",
    ]
)

poetry_requirements(
    name="poetry",
)

pex_binary(
    name="django_manage",
    entry_point="manage.py",
)
