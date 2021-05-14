import React, {useEffect, useState} from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import download from "./download.js";

function Import() {
    const [Data, setData] = useState({hits: []});
    useEffect(async () => {
            const download = await axios(
                '',
            );

            setData(download.data);

        }
    )

    function GetFrom() {

    }

    return <button onClick={GetFrom}>导入广告主信息</button>
}

function Export() {
    const [ReadData, setReadData] = useState({hits: []});
    useEffect(async () => {
            const update = await axios.post(
                'http://localhost:8081/api/io/excel/export/advertisers',
                // {
                //     "api": "http://localhost:8081/api/crud/advertiser/advertisers",
                //     "dict": {},
                //     "search": {},
                //     "type": "API"
                // },
                {
                    "api": "http://localhost:8081/api/crud/advertiser/advertisers",
                    "dict": {},
                    "search": {},
                },
            );

            setReadData(update.data);
        }
    )

    function ExportData() {
        //console.log(ReadData);
        download("http://localhost:8081/api/io/excel/export/advertisers",
            {
                "api": "http://localhost:8081/api/crud/advertiser/advertisers",
                "dict": {},
                "search": {},
                "type": "API"
            }, {
                method: "POST"
            })
    }

    return <button onClick={ExportData}>导出广告主信息</button>
}

function Excelmain() {
    return <>
        <Import></Import>
        <Export></Export>
    </>
}

ReactDOM.render(<Excelmain/>, document.getElementById('root'))
