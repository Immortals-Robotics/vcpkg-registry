# vcpkg-registry
Immortals custom vcpkg registry.

## Ports
- homog2d
- icm-42688
- imgui
- immortals-protos
- immortals-common
- rlimgui
- tmc-api
- vartypes

## Using
Add this to your **vcpkg-configuration.json**'s [registries](https://learn.microsoft.com/en-us/vcpkg/consume/git-registries) section, replacing baseline with the SHA of a commit from this repo
```json
{
  "kind": "git",
  "repository": "https://github.com/Immortals-Robotics/vcpkg-registry",
  "baseline": "3ad0e33575e0d60d277958e141e980b766b1cf61",
  "packages": [
    "homog2d",
    "icm-42688",
    "imgui",
    "immortals-protos",
    "immortals-common",
    "rlimgui",
    "tmc-api",
    "vartypes"
  ]
}
```

## Contributing
Follow the guide [here](https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry). TLDR:

### Add the port
Add your new port to the **ports** folder and commit it.

### Update the versions database
Use this command in repo's root folder:

```bash
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose
```

## License
This project is licensed under the terms of the GNU GPLv3.
