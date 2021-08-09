[1mdiff --git a/src/components/App.css b/src/components/App.css[m
[1mnew file mode 100644[m
[1mindex 0000000..36e2a60[m
[1m--- /dev/null[m
[1m+++ b/src/components/App.css[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32m.video-item {[m
[32m+[m[32m    display: flex !important;[m
[32m+[m[32m    align-items: center !important;[m
[32m+[m[32m    cursor: pointer;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.video-item.item img {[m
[32m+[m[32m    max-width: 180px;[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/components/App.js b/src/components/App.js[m
[1mindex 2426d78..d2b947f 100644[m
[1m--- a/src/components/App.js[m
[1m+++ b/src/components/App.js[m
[36m@@ -1,22 +1,35 @@[m
 import React, { Component } from 'react';[m
 import SearchBar from './SearchBar';[m
 import youtube from "../APIs/youtube";[m
[32m+[m[32mimport VideoList from "./VideoList";[m
[32m+[m[32mimport VideoDetail from "./VideoDetail";[m
[32m+[m[32mimport "./App.css";[m
 [m
 class App extends Component {[m
[31m-    state = {  }[m
[32m+[m[32m    state = {[m
[32m+[m[32m        videos: [],[m
[32m+[m[32m        selectedVideo: null[m
[32m+[m[32m      }[m
 [m
[31m-    onTermSubmit = (term) => {[m
[31m-        youtube.get("/search", {[m
[32m+[m[32m    onTermSubmit = async term => {[m
[32m+[m[32m        const response = await youtube.get("/search", {[m
             params: {[m
                 q: term[m
             }[m
         })[m
[32m+[m[32m        this.setState({ videos: response.data.items })[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    onVideoSelect = (video) => {[m
[32m+[m[32m        this.setState({selectedVideo: video})[m
     }[m
 [m
     render() { [m
         return ([m
             <div className="ui container">[m
                 <SearchBar onFormSubmit={this.onTermSubmit} />[m
[32m+[m[32m                <VideoDetail video={this.state.selectedVideo} />[m
[32m+[m[32m                <VideoList onVideoSelect={this.onVideoSelect} videos={this.state.videos}/>[m
                 </div>[m
           );[m
     }[m
[1mdiff --git a/src/components/VideoDetail.js b/src/components/VideoDetail.js[m
[1mnew file mode 100644[m
[1mindex 0000000..813435f[m
[1m--- /dev/null[m
[1m+++ b/src/components/VideoDetail.js[m
[36m@@ -0,0 +1,11 @@[m
[32m+[m[32mimport React, { Component } from 'react';[m
[32m+[m
[32m+[m[32mconst VideoDetail = ({video}) => {[m
[32m+[m[32m    if (!video) {[m
[32m+[m[32m        return <div>Loading...</div>[m
[32m+[m[32m    }[m[41m [m
[32m+[m[32m        return <div>{video.title}</div>[m
[32m+[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default VideoDetail;[m
\ No newline at end of file[m
[1mdiff --git a/src/components/VideoItem.js b/src/components/VideoItem.js[m
[1mnew file mode 100644[m
[1mindex 0000000..1943a17[m
[1m--- /dev/null[m
[1m+++ b/src/components/VideoItem.js[m
[36m@@ -0,0 +1,19 @@[m
[32m+[m[32mimport React, { Component } from 'react';[m
[32m+[m
[32m+[m[32mclass VideoItem extends Component {[m
[32m+[m[32m    state = {  }[m
[32m+[m[32m    render() {[m[41m [m
[32m+[m[32m        const {snippet} = this.props.video;[m
[32m+[m[32m        const {onVideoSelect} = this.props;[m
[32m+[m[32m        return ([m
[32m+[m[32m            <div className="video-item item" onClick={() => onVideoSelect(snippet)}>[m
[32m+[m[32m                <img className="ui image" src={snippet.thumbnails.medium.url} />[m
[32m+[m[32m                <div className="content">[m
[32m+[m[32m                    <title className="header">{snippet.title}</title>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </div>[m
[32m+[m[32m          );[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[32m+[m[41m [m
[32m+[m[32mexport default VideoItem;[m
\ No newline at end of file[m
[1mdiff --git a/src/components/VideoList.js b/src/components/VideoList.js[m
[1mnew file mode 100644[m
[1mindex 0000000..ceb0543[m
[1m--- /dev/null[m
[1m+++ b/src/components/VideoList.js[m
[36m@@ -0,0 +1,12 @@[m
[32m+[m[32mimport React, { Component } from 'react';[m
[32m+[m[32mimport VideoItem from './VideoItem';[m
[32m+[m
[32m+[m[32mconst VideoList = ({videos, onVideoSelect}) => {[m
[32m+[m[32m    const renderedList = videos.map((video => {[m
[32m+[m[32m        return <VideoItem onVideoSelect={onVideoSelect} video={video} />;[m
[32m+[m[32m    })[m
[32m+[m[32m    )[m
[32m+[m[32m    return <div className="ui relaxed divided list">{renderedList}</div>[m
[32m+[m[32m}[m
[32m+[m[41m [m
[32m+[m[32mexport default VideoList;[m
\ No newline at end of file[m
