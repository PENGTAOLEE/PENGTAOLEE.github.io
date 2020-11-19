;(function () {
    if (window.aomori && window.aomori.gitalk) {
        window.aomori.gitalk.id = md5(window.location.href)
        const gitalkDom = document.getElementById('gitalk-container')
        if (gitalkDom) {
            const gitalk = new Gitalk(window.aomori.gitalk)
            gitalk.render('gitalk-container')
        }
        
    }
})()
