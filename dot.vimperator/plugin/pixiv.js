(function() {
  let libly = liberator.plugins.libly;
  let $U = libly.$U;

  commands.addUserCommand(['pixivBookmark'], 'pixiv bookmark',
    function(args) {
      if (!buffer.URI.match(/www\.pixiv\.net\/member_illust\.php\?.*illust_id=\d+/)) {
        liberator.echoerr('not a pixiv illust page');
        return;
      }

      let tt = $U.getFirstNodeFromXPath('//input[@name="tt"]').value;
      let id = buffer.URI.match(/illust_id=(\d+)/)[1];
      bookmark_illust(id, tt, '', function(res) {
        let m = res.responseText.match(/<strong class="link_visited">\[ <a href="[^"]+">(.+?)<\/a> \]<\/strong>(.+?)<br \/>/);
        liberator.echo('[' + m[1] + '] ' + m[2]);
      });
    },
    {
      completer: function(context, args) {
        let id = buffer.URI.match(/illust_id=(\d+)/)[1];
        let req = new libly.Request('http://www.pixiv.net/bookmark_add.php?type=illust&illust_id=' + id);
        req.addEventListener('onSuccess', function(res) {
          let doc = createHTMLDocument(res.responseText);

          let tags = [];
          let div = doc.getElementsByClassName('bookmark_add_area');
          [div[0], div[1]].forEach(function(e) {
            let as = e.getElementsByTagName('a');
            for each(a in as) {
              tags.push(decodeURI(a.getAttribute('onclick').match(/'([^']+)'/)[1]));
            }
          });

          context.title = ['tag'];
          context.completions = [[t, ''] for each(t in tags)];
        });
        req.get();
      },
      literal: -1,
    },
    true);

  function bookmark_illust(id, tt, comment, next) {
    let params = {
      mode: 'add',
      tt: tt,
      id: id,
      type: 'illust',
      restrict: '0',
      tag: args.map(function(t) encodeURIComponent(t)).join('+'),
      comment: comment,
    };
    let q = [k + '=' + params[k] for (k in params)].join('&');

    let req = new libly.Request('http://www.pixiv.net/bookmark_add.php', null, {postBody: q});
    req.addEventListener('onSuccess', next);
    req.post();
  }

  function createHTMLDocument(text) {
    let c = window.content;
    let doc = c.document.implementation.createDocument('http://www.w3.org/1999/xhtml', 'html', null);
    let range = c.document.createRange();
    range.selectNodeContents(c.document.documentElement);
    let content = doc.adoptNode(range.createContextualFragment(text));
    doc.documentElement.appendChild(content);
    return doc;
  }
})();
