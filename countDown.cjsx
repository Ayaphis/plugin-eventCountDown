{React, ReactBootstrap} = window

timeToString = (time)  ->
  d = time//86400
  hh = (time % 86400)//3600
  mm = (time % 3600)//60
  ss = time % 60
  hh = '0' + hh if  hh < 10
  mm = '0' + mm if  mm < 10
  ss = '0' + ss if  ss < 10
  if d isnt 0
  	timeString = "#{d}天#{hh}小时#{mm}分#{ss}秒"
  else
  	timeString = "#{hh}小时#{mm}分#{ss}秒"

CountDown = React.createClass
  getInitialState: ->
  	shownTime : ""
  	shownLabel : ""
  	color : "purple"
  	extraLabel : @props.extraLabel
  updateCount: ->
    {shownLabel, shownTime, color, extraLabel} = @state
    count = (@props.aimTime - Date.now()) // 1000
    if count > 0
      shownTime = timeToString count
      shownLabel = "距离#{extraLabel}结束还有："
      d = count // 86400
      if d  < 1
        color = 'red'
      else if d < 2
        color = 'orange'
      else if d < 3
        color = 'yellow'
      else
        color = 'green'
    else
      if @props.hanleTimeout?
        @props.hanleTimeout()
      else
      	color = 'red'
      	shownTime = 'Game Over'
      	shownLabel = "#{extraLabel}已经结束"
    @setState {shownLabel, shownTime, color}
  componentDidMount: ->
    setInterval @updateCount, 1000
  componentWillUnmount: ->
    clearInterval @updateCount, 1000
  render: ->
    <div>
      <h3 style={color: @state.color}> {@state.shownLabel} </h3>
      <h2 style={color: @state.color}> {@state.shownTime} </h2>
    </div>

module.exports = CountDown