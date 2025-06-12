__The goal of this project is twofold:__

1. start working out a data access pattern and general data storage model for Lumina.
2. validate that a dynamic dropdown can be added to the editor property list and that this list can be made up of subresources from a tres file.

DO THIS!
- open example_scene.tscn in the godot editor to see an example of the database driven dropdown menu in the inscpector.
- view and edit example_scene.gd to add more properties
- try to create your own demo scene

## To use the Database class:
  - make a new directory
    - call it something like: mycoolinstances_database
  - rightclick in the godot FileSystemPanel on the new directory
  - Select `New Resource`
  - search `Database` and click `Create`
    - give it a name that matches the directory mycoolinstance_database
  - we need extensions of DataSelectionTool and StructuredData
### DataSelectionTool
  This is the class that takes care of generating the editor inspector panel properties
  - create a class that extends the DataSelectionTool
  - create a new file called something like CoolClass.gd
    ```python
    extends DataSelectionTool
    class_name CoolClass
    ```
  - that's it, save the file as CoolClass.gd
  - you _can_ add functionality if you __NEED__ it.
  - (you probably don't need it)
### StructuredData
  This is the class that holds the properties of you new class
  - create a class that extends StructuredData:
  - create a new file called something like CoolClassData.gd
  - give it some __TYPED__ properties.
    ```python
    extends StructuredData
    class_name CoolClassData

    @export var cool_shape: Shape2D
    @export var cool_color: Color

    ```
  - that's it, save the file
  - you can add functionality to the class if you need it
  - ..._buuut_ it is really just meant to hold properties
### You can now edit and update your new database
  - find your new database in the FileSystem panel in godot editor
  - it should be called something like mynewinstances_database (whatever you named it)
  - double click on it.
  - you can now add entries into it.
  - it is good practice for all entries in your database to be of the same type (CoolClassData in this example)
  - once you have added sufficent entries into the database you can make a new scene and add data from the database to that scene
    - look at example_scene.tscn and example_scene.gd for a demonstration on how to do this.

Feel free to open an issue on this repo if you have questions or concerns.
