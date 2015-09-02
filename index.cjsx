{React, ReactBootstrap, FontAwesome, layout} = window
module.exports =
  name: 'EventCountDown'
  priority: 31
  displayName: <span> <FontAwesome key={0} name='clock-o' /> {'活动倒计时'} </span>
  description: "Event Count Down"
  version: '1.1.1'
  author: 'Ayaphis'
  link: 'https://github.com/Ayaphis'
  reactClass: React.createClass
    getInitialState: ->
      shownLabel :"距离活动结束还有："
      shownTime  : "Unknown"
      color      : "blue"
    updateCount:->
      countDown = (Date.UTC(2015,8,7,2) - Date.now())//1000
      if countDown > 0
        d = countDown//86400
        hh = (countDown % 86400)//3600
        mm = (countDown % 3600)//60
        ss = countDown % 60
        hh = '0' + hh if  hh < 10
        mm = '0' + mm if  mm < 10
        ss = '0' + ss if  ss < 10
        _shownTime = d + '天' + hh + '小时' + mm + '分' + ss + '秒'
        _shownLabel = '距离夏季活动结束还有：'

        if d  < 1
          _color = 'red'
        else if d < 2
          _color = 'orange'
        else if d < 3
          _color = 'yellow'
        else
          _color = 'green'

      else
        _color = 'red'
        _shownTime = 'Game Over'
        _shownLabel = '夏季活动已经结束'
      @setState
        shownLabel: _shownLabel
        shownTime : _shownTime
        color     : _color
    componentDidMount: ->
      setInterval @updateCount, 1000
    componentWillUnmount: ->
      clearInterval @updateCount, 1000
    render:->
      <div>
        <h3 style = {color: @state.color}> {@state.shownLabel} </h3>
        <h2 style = {color: @state.color}> {@state.shownTime} </h2>
      </div>
