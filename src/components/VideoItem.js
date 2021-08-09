import React, { Component } from 'react';

class VideoItem extends Component {
    state = {  }
    render() { 
        const {video, onVideoSelect} = this.props;
        return (
            <div className="video-item item" onClick={() => onVideoSelect(video)}>
                <img className="ui image" 
                alt={video.snippet.title} 
                src={video.snippet.thumbnails.medium.url} />
                <div className="content">
                    <title className="header">{video.snippet.title}</title>
                </div>
            </div>
          );
    }
}
 
export default VideoItem;