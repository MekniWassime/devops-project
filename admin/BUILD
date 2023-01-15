python_sources()

docker_image(
    name="admin_container",
    dependencies=[
        ":admin_poetry",
        "!3rdparty:reqs#django",
        ":admin_django_manage",
    ]
)

poetry_requirements(
    name="admin_poetry",
)

pex_binary(
    name="admin_django_manage",
    entry_point="manage.py",
)
