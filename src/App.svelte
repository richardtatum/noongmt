<script lang="ts">
    import { Router, Link, Route } from "svelte-routing"
    import Home from "./routes/Home.svelte";
    import SinglePost from "./routes/SinglePost.svelte";
   
    export let url = "";
</script>

<Router {url}>
    <nav>
        <Link to="/">
            <p>A new song everyday at</p>
            <h1>NOON GMT</h1>
        </Link>
    </nav>
    <div>
        <Route path="/" component={Home}></Route>
        <Route path="/:id" let:params>
            <SinglePost id="{params.id}"/>
        </Route>
    </div>
</Router>

<footer>
    <hr />
    <p>
        Inspired by the once fantastic <a
            href="https://noonpacific.com/"
            target="_blank"
            rel="noreferrer">NOON PACIFIC</a
        >
    </p>
</footer>
