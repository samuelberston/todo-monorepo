import React from 'react';

import styles from './AddTodoOptions.module.css';

import AddTags from './AddTags/AddTags.jsx';
import AddPriority from './AddPriority/AddPriority.jsx';

const AddTodoOptions = (props) => {
    return (
        <div id={styles.options}>
            <div id={styles.option}>
                <AddTags id={styles.option} dispatch={props.dispatch} selectedTags={props.selectedTags} />
            </div>
            <div id={styles.option}>
                <AddPriority dispatch={props.dispatch} priority={props.priority} />
            </div>
            {/*
                due date 
            */}
        </div>
    );
}

export default AddTodoOptions;
