import 'styled-components';

declare module 'styled-components' {
  export interface DefaultTheme {
    id: string;

    colors: {
      primary: string;
      secondary: string;

      logoname: string;
      text: string;

      mvpCard: {
        id: string;
        name: string;
        bg: string;
        text: string;
        killButton: string;
        editButton: string;

        controls: {
          showMap: string;
          edit: string;
          delete: string;
        };
      };

      timers: {
        passed: string;
        normal: string;
        respawning: string;
      };

      switch: {
        bg: string;
        handle: string;
      };

      modal: {
        bg: string;
        text: string;
        hl: string;
        name: string;
        time: string;
        button: string;

        datePicker: {
          border: string;
        };

        mapSelect: {
          border: string;
        };
      };

      filterSearch: {
        bg: string;
        border: string;
        text: string;
      };

      languagePicker: {
        bg: string;
        border: string;
        text: string;
      };

      footer: {
        text: string;
        link: string;
      };
    };
  }
}
