# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
	$('.panel-default .add-todo').click (event) ->
		addTodo(event)

	$('.panel-default #description').on('keypress', (event) ->  	
		if event.keyCode == 13
			addTodo(event)
	)

	$('.all-todos').on('click', '.delete-todo' , (event) ->
  	deleteTodo(event)
  )

	$('.all-todos').on('click', '.bt-edit-todo', (event) ->
		todo_item = $(event.target).parents('.list-group-item')
		todo_item.find('.show-todo').hide()
		todo_item.find('.edit-todo').show()
		todo_item.find('#desc').focus().blur(() ->
			updateTodo(event)
		)
  )

	$('.all-todos').on('click','.bt-update-todo', (event) ->
		updateTodo(event)
  )

	$('.all-todos').on('change', '.finalized-todo', (event) -> 
		finalizedTodo(event)
	)

	$('.all-todos').sortable({
		axis: 'y',
		update: (event, ui)->
			todo_id = $(ui.item).data('todo-id')
			priority = ui.item.index()
			user_id = $(ui.item).parents('.panel-default').data('user')
			$.post("/todos/#{todo_id}/set_priority", priority: priority, user_id: user_id)
  })


	addTodo = (event) ->
		user_id = $(event.target).parents('.panel-default').data('user')
		description = $(event.target).parents('.panel-default').find('#description')

		list_group_todos = $(event.target).parents('.panel-default').find('.list-group')
		$.post('/todos', {user_id: user_id, description: description.val()})
			.done (data) ->
				$(data).appendTo(list_group_todos)
				description.val('')

	updateTodo = (event) ->
		todo_item = $(event.target).parents('.list-group-item')
		todo_item.find('.show-todo').show()
		todo_item.find('.edit-todo').hide()
		todo_id = todo_item.data('todo-id')
		description = todo_item.find('#desc').val()
		todo_item.find('.todo-label').text(description)
		$.ajax({
		  url: "/todos/#{todo_id}",
		  type: 'PUT',
		  data: {todo: {description: description}},
		  success: (data) ->

		})

	finalizedTodo = (event) ->
		todo_item = $(event.target).parents('.list-group-item')
		todo_id = todo_item.data('todo-id')
		finalized = $(event.target).prop('checked')
		if finalized
			todo_item.find('.todo-label').addClass('todo-finalized')
		else
			todo_item.find('.todo-label').removeClass('todo-finalized')

		$.ajax({
		  url: "/todos/#{todo_id}",
		  type: 'PUT',
		  data: {todo: {finalized: finalized}},
		  success: (data) ->

		})

	deleteTodo = (event) ->
		todo_item = $(event.target).parents('.list-group-item')
		todo_id = todo_item.data('todo-id')

		$.ajax({
	    url: "/todos/#{todo_id}",
	    type: 'DELETE',
	    success: (data) ->
	    	todo_item.remove()
		})
