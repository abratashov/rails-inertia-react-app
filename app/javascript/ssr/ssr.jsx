import ReactDOMServer from 'react-dom/server';
import { createInertiaApp } from '@inertiajs/inertia-react';
import cjsCreateServer from '@inertiajs/server';

const createServer = typeof cjsCreateServer === 'function' ? cjsCreateServer : cjsCreateServer.default

createServer((page) => createInertiaApp({
  page,
  render: ReactDOMServer.renderToString,
  resolve: (name) => import(`../pages/${name}.jsx`).then(module => module.default),
  setup: ({ App, props }) => <App {...props} />,
}))
