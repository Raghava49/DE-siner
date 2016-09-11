fs = require 'fs'

config = content: [{
  type: 'row'
  content: [{
      type: 'component'
      componentName: 'Explorer'
    }
    {
      type: 'component'
      componentName: 'Settings'
    }
		{
			type: 'component'
			componentName: 'Code'
		}
		{
			type: 'component'
			componentName: 'Project'
		}
		{
			type: 'component'
			componentName: 'Requirements'
		}]
}]


savedState = localStorage.getItem('savedState')
if savedState != null
  myLayout = new GoldenLayout(config)
		st = JSON.stringify(JSON.parse(savedState))
		fs.writeFile 'rag.txt', st, (err) ->
			if err
				console.log 'err='+err
else
	myLayout = new GoldenLayout(config)

myLayout.registerComponent 'Explorer', (container, componentState) ->
  container.getElement().load './explorer/explorer.html'

myLayout.registerComponent 'Project', (container, componentState) ->
  container.getElement().html '<h1>Project<h1>'

myLayout.registerComponent 'Settings', (container, componentState) ->
  container.getElement().html '<h1>Settings<h1>'

myLayout.registerComponent 'Requirements', (container, componentState) ->
  container.getElement().html '<h1>Requirements<h1>'

myLayout.registerComponent 'Code', (container, componentState) ->
  container.getElement().html '<h1>Code<h1>'

myLayout.init()
myLayout.on 'stateChanged', ->
  state = JSON.stringify(myLayout.toConfig())
  localStorage.setItem 'savedState', state
