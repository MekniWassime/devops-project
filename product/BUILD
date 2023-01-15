python_sources()

docker_image(
    name="product_container",
    dependencies=[
        ":product_poetry",
        "!:product_poetry#django",
        ":product_django_manage",
    ]
)

poetry_requirements(
    name="product_poetry",
    dependencies=[
        "!3rdparty::#django"
    ]
)

pex_binary(
    name="product_django_manage",
    entry_point="manage.py",
)
