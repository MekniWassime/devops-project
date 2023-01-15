python_sources()

docker_image(
    name="product_container",
    dependencies=[
        ":product_poetry",
        "!3rdparty:#django",
        ":product_django_manage",
    ]
)

poetry_requirements(
    name="product_poetry",
)

pex_binary(
    name="product_django_manage",
    entry_point="manage.py",
)
