{React, ReactBootstrap, FontAwesome, layout} = window

CountDown = require './countDown'

getRenew = ->
  renew = new Date()
  if renew.getUTCHours() < 20
    renew.setUTCHours(20)
  else
    renew.setUTCHours(44)
  renew.getTime()

module.exports =
  name: 'EventCountDown'
  priority: 511
  displayName: <span> <FontAwesome key={0} name='clock-o' /> {'活动计时'} </span>
  description: "Event Count Down"
  version: '1.2.0'
  author: 'Ayaphis'
  link: 'https://github.com/Ayaphis'
  reactClass: React.createClass
    getInitialState: ->
      eventFinal : Date.UTC(2015,11,7,2)
      bossRenew  : getRenew()
    handleBossRefresh: ->
      @setState
        bossRenew : getRenew()
    render: ->
      <div>
        <div className='eventCount'>
          <CountDown
            indexKey={0}
            extraLabel={'秋季活动'}
            aimTime={@state.eventFinal} />
        </div>
        <div className='bossCount'>
          <CountDown 
            indexKey={1}
            extraLabel={"削甲效果重置"}
            aimTime={@state.bossRenew}
            handleTimeout={@state.handleBossRefresh} />
        </div> 
      </div>