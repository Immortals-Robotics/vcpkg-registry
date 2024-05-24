# vcpkg-registry
Immortals custom vcpkg registry.

## Ports
- homog2d
- imgui
- immortals-common
- rlimgui
- vartype

## Using
Add this to your **vcpkg-configuration.json**'s [registries](https://learn.microsoft.com/en-us/vcpkg/consume/git-registries) section
```json
{
  "kind": "git",
  "repository": "https://github.com/Immortals-Robotics/vcpkg-registry",
  "baseline": "1c950a9dae86739f6192c02ff55827726346e8bf",
  "packages": [
    "homog2d",
    "imgui",
    "immortals-common",
    "rlimgui",
    "vartypes"
  ]
}
```

## Contributing
Follow the guide [here](https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry). TLDR:

### Add the port
Add your new port to the **ports** folder.

### Update the versions database
Use this command in repo's root folder:

```bash
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose
```

## License
This project is licensed under the terms of the GNU GPLv3.
