export default (api, data = {}, options = {}) => {

    const { method = 'get', fileName } = options;

    let fapi = api;
    let payload = {};

    // if (method === 'get') {
    //     fapi = `${api}?${qs.stringify(data)}`
    // } else {
    //     if (data) {
    //         payload = JSON.stringify(data);
    //     }
    // }

    return fetch(fapi, {
        method,
        responseType: 'blob',
        headers: {
            "Content-Type": "application/json"
        },
        params: method === 'get' ? data : undefined,
        body: method !== 'get' ? JSON.stringify(data) : undefined,
    })
        .then(res => {
            // 转为blob对象，然后通过 URL.createObjectURL() 生成一个地址
            // res.blob().then(function (myBlob) {
            //   const url = URL.createObjectURL(myBlob);
            //   // 跳转新窗口
            //   if (url) {
            //     window.open(url)
            //   }
            //   // 下载
            //   // let a = document.createElement('a')
            //   // a.download = 'equipmentOut.pdf'
            //   // a.href = url
            //   // document.body.appendChild(a)
            //   // a.click()
            //   // a.remove()
            // });
            return res.blob().then(blob => downloadFile(res, blob))
        })


    function downloadFile(res, blob) {
        const contentType = res.headers['content-type'];

        if (contentType && contentType.indexOf('application/json') > -1) {
            return Promise.resolve(res);
        } else {
            let fileName = 'file';

            // https://stackoverflow.com/questions/48413050/missing-headers-in-fetch-response/48432628
            for (let entry of res.headers.entries()) {
                if (entry[0] === 'content-disposition' || entry[0] === 'filename'){
                    fileName = getFileName(entry[1]);
                }
            }
            if (window.navigator.msSaveOrOpenBlob) {
                navigator.msSaveBlob(blob, fileName); //兼容ie10
            } else {
                const link = document.createElement("a");
                const evt = document.createEvent("HTMLEvents");
                evt.initEvent("click", false, false);
                link.href = URL.createObjectURL(blob);
                link.download = fileName;
                link.target = '_blank';
                link.style.display = "none";
                document.body.appendChild(link);
                link.click();
                link.remove();
                window.URL.revokeObjectURL(link.href);
            }
        }
    }

    function getFileName(disposition, defaultName = '') {

        const matchRst = disposition.match(/filename=["]{0,1}([\w.@%-]+)["]{0,1}/i);
        let fileName = '';
        if(matchRst){
            fileName = matchRst && decodeURI(matchRst[1]) || defaultName;
        }else{
            fileName = decodeURI(disposition) || defaultName
        }

        return fileName;
    }

}