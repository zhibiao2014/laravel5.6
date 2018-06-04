<section class="hero is-info is-medium is-bold" style="background: url('/themes/bulma/assets/img/8.jpg');background-size: cover;">
    <div class="hero-head">
        <nav class="navbar">
            <header>
                <div id="toolbar"
                     {{--mdui-appbar-scroll-toolbar-hide--}}
                     class="mdui-toolbar mdui-shadow-0 mdui-appbar-fixed">
                    <button class="mdui-btn mdui-btn-icon" id="menu"
                            mdui-drawer="{target:'#left-drawer',overlay:'false'}"><i class="mdui-icon material-icons">menu</i>
                    </button>
                    <a href="javascript:;" class="mdui-typo-headline">
                        <span id="span">
                            Teeoo
                        </span>
                    </a>
                    <div class="mdui-typo card-title"><h4></h4></div>
                    <div class="mdui-toolbar-spacer"></div>
                    <button class="mdui-btn mdui-btn-icon seai"><i class="mdui-icon material-icons"></i></button>
                </div>
            </header>
        </nav>
        <div class="mdui-drawer mdui-color-white mdui-drawer-close " id="left-drawer">
            <div class="drawer-billboard drawer-item">
                <a href="#">
                    <img width="280" height="144" class="drawer-logo border-radius"
                         src="/themes/bulma/assets/img/8.jpg">
                    <div class="drawer-description"></div>
                </a>
            </div>
            <form class="mdui-textfield mdui-textfield-floating-label drawer-search drawer-item" method="post"
                  action="">
                <label class="mdui-textfield-label drawer-search-content">搜索</label>
                <input class="mdui-textfield-input" type="text" name="s">
            </form>
            <div class="mdui-list" mdui-collapse="{accordion: true}" style="margin-bottom: 76px;">
                <div class="mdui-collapse-item ">
                    <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                        <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">near_me</i>
                        <div class="mdui-list-item-content">分类</div>
                        <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                    </div>
                    <div class="mdui-collapse-item-body mdui-list">
                        @if(isset($metas))
                            @foreach($metas as $me)
                                <a href="/types/{{$me->slug}}" class="mdui-list-item mdui-ripple ">{{$me->types}}</a>
                            @endforeach
                        @else
                        @endif
                    </div>
                </div>

                <div class="mdui-collapse-item ">
                    <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                        <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-deep-orange">layers</i>
                        <div class="mdui-list-item-content">页面</div>
                        <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                    </div>
                    <div class="mdui-collapse-item-body mdui-list">

                    </div>
                </div>
                <div class="mdui-collapse-item">
                    <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                        <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-green">widgets</i>
                        <div class="mdui-list-item-content">友联</div>
                        <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                    </div>
                    <div class="mdui-collapse-item-body mdui-list" style="">

                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="hero-body">
        <div class="container has-text-centered">
            <h1 class="title">
                Teeoo
            </h1>
            <h2 class="subtitle">
                幸 有 你 来,不 悔 初 见
            </h2>
        </div>
    </div>
</section>