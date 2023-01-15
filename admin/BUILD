python_sources()

docker_image(
    name="admin_container",
    dependencies=[
        # ":admin_poetry",
        ":admin_django_manage",
    ],
    image_tags=["admin-{build_args.GIT_SHA}"]
)

# poetry_requirements(
#     name="admin_poetry",
# )

pex_binary(
    name="admin_django_manage",
    entry_point="manage.py",
)
