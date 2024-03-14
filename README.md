# LocalizeCleaner
This script helps in identifying and optionally deleting unused `.strings` file entries within an Xcode project. It scans through your project's `.swift`, `.m`, and `.h` files to determine if the keys in your `.strings` files are being referenced. If a key is not found in the codebase, it's reported as unused.

## Usage
The script can be used in two modes: inspection and deletion.

### Inspection Mode
To simply inspect and report unused strings without deleting them:

```
./localizeCleaner.sh [path_to_project_root]
```

Or if you want to start in the current directory:

```
./localizeCleaner.sh
```

### Deletion Mode
To delete the unused strings automatically:

```
./localizeCleaner.sh [path_to_project_root] delete
```

Or if you want to start in the current directory:

```
./localizeCleaner.sh delete
```
