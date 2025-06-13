# loteque.database (v0.5)
> __What is this?__

__A simple database class for godot engine 4.x__

The database has 2 critical parts and 1 optional part:

__Critical__:
- the database itself
- the data class

__Optional__:
- the database adapter

## How to use the Database:

_What we will do from a high level:_
- add instances of the data class to the database
  1. create your own data class
  2. create your own database class
  3. create your own data selection tool class (optional)
  4. create data in the database

### SDClass
- class_name: __SDClass__
- path: _addons/loteque.database/Database/SDClass.gd_
- desc: This is the class that holds the properties of you new class
- usage: _extend this class to constuct your own data class_
  - First create a dir like mycoolinstances_database (we will work in this dir)
  - create a class that extends StructuredData:
  - create a new file called something like `mycoolinstances_database/CoolClassData.gd`
  - give it some __TYPED__ properties.
    - example: _CoolClassData.gd
    ```python
    extends SDDData
    class_name CoolClassData

    @export var cool_shape: Shape2D
    @export var cool_color: Color
    ```
  - that's it, save the file
  - you can add functionality to the class if you need it
  - ..._buuut_ it is really just meant to hold properties
### SDDatabase
- class_name: __SDDatabase__
- path: _addons/loteque.database/Database/SDDatabase.gd_
- desc: This is the class that holds all of your instances of your data class
- usage: _generate database resource file_
  - rightclick in the godot FileSystemPanel on the `mycoolinstances_database` directory
  - Select `New Resource`
  - search `SDDatabase` and click `Create`
    - give it a name that matches the directory `mycoolinstance_database`
### SDAdapter
  - class_name: __SDAdapter__
  - path: _addons/loteque.database/Database/SDAdapter.gd_
  - desc: This is the class that helps manipulate your database with instances of your data class
  - usage: _extend this class to constuct your own adapter class_
    - create a class that extends SDAdapter
    - create a new file called something like `CoolClass.gd`
      ```python
      extends SDAdapter
      class_name CoolClass

      const DATABASE_PATH = "res://mycoolinstances_database/mycoolinstances_database.tres"

      func init(initdb: SDDatabase = load(DATABASE_PATH)) -> void:
        db = initdb

      ```
    - that's it, save the file as CoolClass.gd
    - you _can_ add functionality if you __NEED__ it.
    - (you probably don't need it)
  
__You can now update your new database:__
  - find your new database in the FileSystem panel in godot editor
  - it should be called something like mynewinstances_database (whatever you named it)
  - double click on it.
  - you can now add entries into it.
  - it is good practice for all entries in your database to be of the same type (CoolClassData in this example)
  - once you have added sufficent entries into the database you can make a new scene and add data from the database to that scene
    - look at example_scene.tscn and example_scene.gd for a demonstration on how to do this.

_Feel free to open an issue at https://github.com/Loteque/loteque.database/issues if you have questions or concerns._
