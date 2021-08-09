import axios from "axios";

const KEY = "AIzaSyAqnJB6uBZUVnLjFpGDKtr2WFlKIPhPiJ4";

export default axios.create({
baseURL: "https://www.googleapis.com/youtube/v3",
params: {
    part: "snippet",
    type: "video",
    maxResults: 5,
    regionCode: "GB",
    key: KEY
}
});