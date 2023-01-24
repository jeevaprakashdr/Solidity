// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// insert, update, read from array of structs
contract TodoList {
       struct Todo {
           string text;
           bool completed;
       }

       Todo[] public todos;

       function create(string calldata _text) external {
           todos.push(Todo({
               text: _text,
               completed: false
           }));
       }

       function updateTest(uint _index, string calldata _text) external {
           // method one 
           todos[_index].text = _text;

            // method two
            // save gas while updating multiple properties or same proptery multiple times
           Todo storage todo = todos[_index];
           todo.text  = _text;
       }

       function get(uint _index) external view returns (string memory, bool) {
            // memory is more expensive 
            // storage is less expensive 
            Todo memory todo = todos[_index];
            return (todo.text, todo.completed);
       }

       function toggleToCompleted(uint _index) external {
           todos[_index].completed = !todos[_index].completed;
       }
}