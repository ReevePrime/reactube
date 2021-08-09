import React, { Component } from 'react';

const VideoDetail = ({video}) => {
    if (!video) {
        return <div>Loading...</div>
    } 
        return <div>{video.title}</div>

}

export default VideoDetail;