#!/bin/bash

# To-Do List Tracker

# Location of the to-do list file
TODO_FILE="todo_list.txt"

# Function to display the to-do list
display_list() {
    echo "To-Do List:"
    if [ -f "$TODO_FILE" ]; then
        cat -n "$TODO_FILE"
    else
        echo "No tasks yet. Add a task first!"
    fi
}

# Function to add a new task
add_task() {
    echo "Enter your new task:"
    read task
    echo "$task" >> "$TODO_FILE"
    echo "Task added!"
}

# Function to delete a task
delete_task() {
    echo "Enter the task number to delete:"
    read task_number
    sed -i "${task_number}d" "$TODO_FILE"
    echo "Task deleted!"
}

# Function to mark a task as done
mark_done() {
    echo "Enter the task number to mark as done:"
    read task_number
    sed -i "${task_number}s/^/DONE: /" "$TODO_FILE"
    echo "Task marked as done!"
}

# Main menu
while true; do
    echo ""
    echo "============================"
    echo "To-Do Tracker Menu"
    echo "============================"
    echo "1. Display To-Do List"
    echo "2. Add a Task"
    echo "3. Delete a Task"
    echo "4. Mark a Task as Done"
    echo "5. Exit"
    echo "============================"
    echo -n "Choose an option: "
    read choice

    case $choice in
        1) display_list ;;
        2) add_task ;;
        3) delete_task ;;
        4) mark_done ;;
        5) echo "Exiting..."; break ;;
        *) echo "Invalid option, please try again." ;;
    esac
done
