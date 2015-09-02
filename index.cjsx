module.exports =
  name: 'EventCountDown'
  priority: 31
  displayName: <span><FontAwesome key={0} name='fa-clock-o' />{活动倒计时)}</span>
  description: "Event Count Down"
  version: '1.0.0'
  author: 'Ayaphis'
  link: 'https://github.com/Ayaphis'
  reactClass: React.createClass
    getInitialState: ->
      shownLabel :"距离活动结束还有："
      shownTime  : "Unknown"
      bss        : "primary"
    updateCount:->
      countDown = (Date.UTC 2015,8,7,2 - Date.now())//1000
      d = countDown//86400
      hh = (countDown % 86400)//3600
      mm = (countDown % 3600)//60
      ss = countDown % 60
      hh = '0' + hh if  hh < 10
      mm = '0' + mm if  mm < 10
      ss = '0' + ss if  ss < 10
      if d  < 1
        _bss = 'danger'
      else if d < 2
        _bss = 'warning'
      else if d < 3
        _bss = 'info'
      else 
        _bss = 'success'
      @setState
        shownTime : d + '天' + hh + '小时' + mm + '分' + ss + '秒'
        bss       : _bss
    componentDidMount: ->
      setInterval @updateCount, 1000
    componentWillUnmount: ->
      clearInterval @updateCount, 1000
    render:->
      <div>
        <h3> {@state.shownLabel} </h3>
        <h1 bsStyle = @state.bss> {@state.shownTime} </h1>
      </div>
