# ViperUIKitCLI

A Swift CLI Tool for generating template files for [ViperUIKit](https://github.com/crystalwinghero/ViperUIKit) package.

### Compatibility
| ViperUIKitCLI version | ViperUIKit version |
| --- | --- |
| 1.0.1 | 1.1.1+ |

### Installation 
copy cli to your local bin exec directory, run:
``` bash
  bash install.sh
```
or copy executable file manually from `bin/viper-uikit-cli` to your `/usr/local/bin/`:
  ``` bash
  cp bin/viper-uikit-cli /usr/local/bin/
  ```

### Instructions
- Run script: `viper-uikit-cli <YourModuleName>.<ViperName>` for empty `UIViewController`
- Or run: `viper-uikit-cli <YourModuleName>.<ViperName> --table` for `UIViewController` with `UITableView`
- Output files should be in your `~/Documents/<ViperName>/` 


### Rebuild executable file from scratch 
- Run: `bash build.sh`
