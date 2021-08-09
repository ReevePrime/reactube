import React, { Component } from 'react';

class VideoItem extends Component {
    state = {  }
    render() { 
        const {snippet} = this.props.video;
        const {onVideoSelect} = this.props;
        return (
            <div className="video-item item" onClick={() => onVideoSelect(snippet)}>
                <img className="ui image" src={snippet.thumbnails.medium.url} />
                <div className="content">
                    <title className="header">{snippet.title}</title>
                </div>
            </div>
          );
    }
}
 
export default VideoItem;