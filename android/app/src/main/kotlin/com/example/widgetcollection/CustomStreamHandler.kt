package com.example.widgetcollection

import io.flutter.plugin.common.EventChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.launch

class CustomStreamHandler(private val coroutineScope: CoroutineScope) : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    fun doAction() {
        coroutineScope.launch {
            methodC().collect {
                eventSink!!.success(it)
            }
        }
    }

    private fun methodC() = flow {
        emit(11111)
        delay(2000)
        emit(22222)
        delay(2000)
        emit(33333)
    }
}