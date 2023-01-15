python_sources()

docker_image(
    name="product_container",
    dependencies=[
        # "!:product_poetry",
        ":product_django_manage",
    ],
    image_tags=["product-{build_args.GIT_SHA}", "product-latest"]
)

# poetry_requirements(
#     name="product_poetry",
# )

pex_binary(
    name="product_django_manage",
    entry_point="manage.py",
)
