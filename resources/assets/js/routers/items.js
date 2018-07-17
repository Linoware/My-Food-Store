import Item from '../components/items/Item'

import Form from '../components/items/Form'
export default [{
    path: '/items',
    component: Item,
    children: [{
        path: 'create',
        component: Form
    }]
}]