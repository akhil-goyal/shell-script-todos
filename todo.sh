# --------------------------------- ARRAY ----------------------------------------
allTodos=('Go for walk' 'Exercise at gym' 'See the doctor' 'Hangout with friends' 'Complete assignments');
# --------------------------------------------------------------------------------


# ------------------------------- FUNCTIONS --------------------------------------
function listTodos(){

  echo "All Todos : "
  
  # Looping through the available todos.
  for i in "${!allTodos[@]}"; do 
    printf "%s\t%s\n" "${allTodos[$i]}"
  done

}

function addTodo(){

  # Appending the new todo at end of the array.
  allTodos=( "${allTodos[@]}" "$1" )

  echo "The todo has been added successfully! Here's the updated list of todos : "

  # Looping through the available todos.
  for i in "${!allTodos[@]}"; do 
    printf "%s\t%s\n" "$i" "${allTodos[$i]}"
  done

}

function deleteTodo(){

  # Deleting the todo according to the index received.
  unset allTodos[$1]

  # After unsetting, the index number also deletes away, thus causing a 
  # gap between the numbers. Therefore, rebuilding the array using a 
  # temporary array to store the values in order to plug in the gaps.
  for i in "${!allTodos[@]}"; do
    temp_array+=( "${allTodos[i]}" )
  done

  allTodos=("${temp_array[@]}")

  # Deleting the temporary array after it has
  # served its purpose.
  unset temp_array

  echo "The todo has been deleted successfully! Here's the updated list of todos : "

  # Looping through the available todos.
  for i in "${!allTodos[@]}"; do 
    printf "%s\t%s\n" "$i" "${allTodos[$i]}"
  done

}

function updateTodo(){

  # Updating the existing array with index number
  # & new array element. Syntax : array[index]='New element'
  allTodos[$1]=$2

  echo "The selected todo has been updated successfully! Here's the updated list of todos : "

  # Looping through the available todos.
  for i in "${!allTodos[@]}"; do 
    printf "%s\t%s\n" "$i" "${allTodos[$i]}"
  done

}

function exitFunction(){

    echo "Sorry to see you go. See you soon!"

    exit 0

}

function errorHandler(){

    echo "$userInput is an invalid input. Please try again!"

}
# --------------------------------------------------------------------------------


# -------------------------- CONDITIONING & LOOPS --------------------------------
while true; do

# User Menu : It will re-display until the user exits.

  echo "Please choose an operation from the list below :"
  echo "1. List all Todos"
  echo "2. Add Todo"
  echo "3. Delete Todo"
  echo "4. Update Todo"
  echo "5. Quit"

# Capturing the User Input

  read userInput

# Using switch cases to check for user input & invoke the appropriate function.

  case $userInput in
      "1")

        # Calling the listTodos function.
        listTodos
      ;;

      "2")

        echo "Create a new todo : "

        read todo

        # Calling the addTodo function and setting $todo as parameter.
        # $todo has been wrapped in double quotes so that the input may
        # wrap whitespace as well. Otherwise, it will not cover the 
        # space.
        addTodo "$todo"
      ;;

      "3")

        echo "Which todo to delete? Enter the associated index : "

        # Looping through the available todos.
        for i in "${!allTodos[@]}"; do 
          printf "%s\t%s\n" "$i" "${allTodos[$i]}"
        done

        read todo

        # Calling the deleteTodo function and setting $todo as parameter.
        deleteTodo $todo
      ;;

      "4")
        
        echo "Which todo to update? Enter the associated index : "

        # Looping through the available todos.
        for i in "${!allTodos[@]}"; do 
          printf "%s\t%s\n" "$i" "${allTodos[$i]}"
        done

        read todoIndex

        echo "Enter the new todo : "

        read todo
        
        # Calling the updateTodo function and setting $todoIndex, $todo as
        # parameters. $todo has been wrapped in double quotes so that the 
        # input may wrap whitespace as well. Otherwise, it will not cover
        # the space.
        updateTodo $todoIndex "$todo"
      ;;

      "5")

        # Calling the function exitFunction.
        exitFunction
      ;;

      # Asterisk (*) sign denotes any other value apart from those specified
      # in the cases. 
      *)

        # Calling the function errorHandler & setting userInput as parameter.
        errorHandler $userInput
      ;;
  esac
done
# --------------------------------------------------------------------------------