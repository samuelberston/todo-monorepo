import React from 'react';
import axios from 'axios';

import todoItems from '../../../dummydata/todoItems.js'

import styles from './App.module.css';

import Header from './Header/Header.jsx';
import Today from './Today/Today.jsx';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
    };
  }

  componentDidMount() {
  }

  render() {
    return (
      <div id={styles.container}>
        <Header username="Samuel"/>
        <Today todoItems={todoItems}/>
      </div>
    );
  }
}

export default App;
