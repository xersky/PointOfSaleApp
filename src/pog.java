import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import java.awt.FlowLayout;
import java.awt.Checkbox;
import java.awt.Dimension;
import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Toolkit;
import java.awt.Color;
import java.awt.SystemColor;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Vector;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;


public class pog extends JFrame{

    private static final long serialVersionUID = 4654181491120462005L;
    private JTextField textFieldEnterID;
    private JTextField textFieldEnterQuantity;
    private JTextField textFieldEnterPayedPrice;
    private JTextField textFieldTransactionSearchID;

    private Button btnValidatePayment = new Button("Valider payement");
    private Button btnNewTransaction = new Button("Nouvelle transaction");



    DefaultTableModel model;
    DefaultTableModel modelTransaction;
    DefaultTableModel modelTransactionDetails;

    static String url = "jdbc:mysql://localhost:3306/rebaja_centro?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    static String username = "root";
    static String password = "lolilol123";

    Double[] itemTP = new Double[255];

    Double caisseSolde;

    double transactionDetailsFinalPT;
    String transactionDetailsFinalTIME;

    //Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    int screenSizeWidth = 1024;
    int screenSizeHeight = 768;
    int selectedTransactionID;
    boolean A=true;

    int ID;
    int index = 0;
    int validateFinal = 0;

    public static void main(String[] args){

        pog myWindow = new pog();
        myWindow.setVisible(true);

    }


    public pog() {

        JWindow window = new JWindow();

        window.getContentPane().add(
                new JLabel("", new ImageIcon("C:\\Users\\App groupe\\Downloads\\images\\cover.jpg"), SwingConstants.CENTER));

        window.setSize(screenSizeWidth, screenSizeHeight);
        window.setLocationRelativeTo(null);
        window.setVisible(true);
        try {
            Thread.sleep(3500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        window.setVisible(false);




        setIconImage(Toolkit.getDefaultToolkit().getImage("C:\\Users\\App groupe\\Downloads\\images\\logo.jpg"));
        setTitle("Rebaja Centro PoS");
        setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        WindowListener exitListener = new WindowAdapter() {

            @Override
            public void windowClosing(WindowEvent e) {
                JOptionPane.showMessageDialog(null, "La caisse doit contenir :\n" + ( (double) (Math.round(caisseSolde*100 )) /100 )+ " DH","Information", JOptionPane.INFORMATION_MESSAGE);
                int confirm = JOptionPane.showOptionDialog(
                        null, "Etes-vous sur de quitter l'application?",
                        "Confirmation de la fermeture", JOptionPane.YES_NO_OPTION,
                        JOptionPane.QUESTION_MESSAGE, null, null, null);
                if (confirm == 0) {
                    System.exit(0);
                }
            }
        };

        addWindowListener(exitListener);

        JPanel contentPane = (JPanel) this.getContentPane();


        //HEADER
        contentPane.add(createHeaderBar(), BorderLayout.NORTH);


        // BODY & TABLE
        try {

            Connection conn = DriverManager.getConnection(url,username,password) ;
            Statement stmt = conn.createStatement() ;
            String query = "select * from scategorie ;" ;
            ResultSet rs = stmt.executeQuery(query) ;
            if ( rs.next() ) {
                JOptionPane.showMessageDialog(null, "La base de donn\u00E9es est charg\u00E9 avec succès !", "Information", JOptionPane.INFORMATION_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Problème du chargement de la base de donn\u00E9es !\nVeuillez d\u00E9marrez le serveur mysql avant de lancer le logiciel\n"+ e,"Erreur", JOptionPane.ERROR_MESSAGE);
            System.exit(1);
        }

        while(true)
        {
            try {
                caisseSolde = Double.parseDouble(JOptionPane.showInputDialog(null,"Entrer le solde de la caisse :"));
                break;
            } catch(NumberFormatException ex)
            {
                JOptionPane.showMessageDialog(null, "Erreur de saisie","Erreur", JOptionPane.ERROR_MESSAGE);
            }
        }

        JTable table = new JTable();
        JScrollPane scrollPane = new JScrollPane();

        table.setModel(new javax.swing.table.DefaultTableModel(
                new Object [][] {

                },
                new String [] {
                        "ID", "Description", "Quantit\u00E9", "Prix d'unit\u00E9", "Prix total"
                }
        ) {
            /**
             *
             */
            private static final long serialVersionUID = 1L;
            boolean[] canEdit = new boolean [] {
                    false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });

        model = (DefaultTableModel) table.getModel();

        table.setFont(new Font("Source Code Pro Medium", Font.PLAIN, 18));
        table.getTableHeader().setReorderingAllowed(false);
        table.setRowHeight(35);

        scrollPane.setViewportView(table);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        contentPane.add(scrollPane, BorderLayout.CENTER);

        pack();





        //FOOTER
        contentPane.add(createFooterBar(), BorderLayout.SOUTH);

        setExtendedState(JFrame.MAXIMIZED_BOTH);

    }


    public JPanel createHeaderBar() {


        JPanel header = new JPanel(new FlowLayout());

        JLabel labelEnterID = new JLabel("Entrer l'identifiant d'un item");
        labelEnterID.setHorizontalAlignment(SwingConstants.LEFT);
        header.add(labelEnterID);



        textFieldEnterID = new JTextField();
        textFieldEnterID.setHorizontalAlignment(SwingConstants.LEFT);
        textFieldEnterID.setToolTipText("Entrer l'identifiant d'un item");
        textFieldEnterID.setColumns(10);
        header.add(textFieldEnterID);



        JLabel labelEnterQuantity = new JLabel("Entrer la quantit\u00E9");
        labelEnterQuantity.setHorizontalAlignment(SwingConstants.RIGHT);
        header.add(labelEnterQuantity);

        textFieldEnterQuantity = new JTextField();
        textFieldEnterQuantity.setHorizontalAlignment(SwingConstants.LEFT);
        textFieldEnterQuantity.setToolTipText("Entrer la quantit\u00E9");
        textFieldEnterQuantity.setColumns(3);
        header.add(textFieldEnterQuantity);

        JButton btnAddToTransaction = new JButton("Ajouter \u00E0 la transaction");
        btnAddToTransaction.setHorizontalAlignment(SwingConstants.LEFT);
        header.add(btnAddToTransaction);

        btnAddToTransaction.addKeyListener(new KeyAdapter() {
            public void keyPressed(KeyEvent e) {
                if (e.getKeyChar() == KeyEvent.VK_ENTER) {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e1) {
                        e1.printStackTrace();
                    }
                    int itemQuantity ;
                    if(textFieldEnterQuantity.getText().isEmpty()) itemQuantity=1;

                    else itemQuantity = Integer.parseInt(textFieldEnterQuantity.getText());

                    String itemID = textFieldEnterID.getText();

                    int check = 0;

                    if(!itemID.isEmpty()){
                        try {


                            Connection conn = DriverManager.getConnection(url,username,password) ;
                            Statement stmt = conn.createStatement() ;
                            ResultSet rs = stmt.executeQuery("SELECT * from PRODUIT WHERE ID = " + itemID + ";") ;
                            if(rs.next()) {
                                check=1;
                                itemID=rs.getString("ID");
                                model.insertRow(model.getRowCount(), new Object[] {itemID , rs.getString("DESCRIPTION"), itemQuantity , rs.getDouble("PRIX_UNITE") + " DH", (itemTP[index] = ((double) (Math.round((rs.getDouble("PRIX_UNITE") * itemQuantity)*100 )) /100 ) ) + " DH"});
                                index+=1;
                            }else JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);

                        } catch (SQLException e3) {
                            JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);
                        }



                    }
                    textFieldEnterID.setText(null);
                    textFieldEnterQuantity.setText(null);
                    if(check==1) btnValidatePayment.setEnabled(true);
                    textFieldEnterID.requestFocusInWindow();

                }

            }

        });
        textFieldEnterID.addKeyListener(new KeyAdapter() {
            public void keyPressed(KeyEvent e) {
                if (e.getKeyChar() == KeyEvent.VK_ENTER) {
                    int itemQuantity ;
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e2) {
                        e2.printStackTrace();
                    }
                    if(textFieldEnterQuantity.getText().isEmpty()) itemQuantity=1;

                    else itemQuantity = Integer.parseInt(textFieldEnterQuantity.getText());

                    String itemID = textFieldEnterID.getText();

                    int check = 0;

                    if(!itemID.isEmpty()){
                        try {


                            Connection conn = DriverManager.getConnection(url,username,password) ;
                            Statement stmt = conn.createStatement() ;
                            ResultSet rs = stmt.executeQuery("SELECT * from PRODUIT WHERE ID = " + itemID + ";") ;
                            if(rs.next()) {
                                check=1;
                                itemID=rs.getString("ID");
                                model.insertRow(model.getRowCount(), new Object[] {itemID , rs.getString("DESCRIPTION"), itemQuantity , rs.getDouble("PRIX_UNITE") + " DH", (itemTP[index] = ((double) (Math.round((rs.getDouble("PRIX_UNITE") * itemQuantity)*100 )) /100 ) ) + " DH"});
                                index+=1;
                            }else JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);

                        } catch (SQLException e3) {
                            JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);
                        }



                    }
                    textFieldEnterID.setText(null);
                    textFieldEnterQuantity.setText(null);
                    if(check==1) btnValidatePayment.setEnabled(true);
                    textFieldEnterID.requestFocusInWindow();

                }

            }

        });

        textFieldEnterQuantity.addKeyListener(new KeyAdapter() {
            public void keyPressed(KeyEvent e) {
                if (e.getKeyChar() == KeyEvent.VK_ENTER) {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e2) {
                        e2.printStackTrace();
                    }
                    int itemQuantity ;
                    if(textFieldEnterQuantity.getText().isEmpty()) itemQuantity=1;

                    else itemQuantity = Integer.parseInt(textFieldEnterQuantity.getText());

                    String itemID = textFieldEnterID.getText();
                    int check = 0;

                    if(!itemID.isEmpty()){
                        try {


                            Connection conn = DriverManager.getConnection(url,username,password) ;
                            Statement stmt = conn.createStatement() ;
                            ResultSet rs = stmt.executeQuery("SELECT * from PRODUIT WHERE ID = " + itemID + ";") ;
                            if(rs.next()) {
                                check=1;
                                itemID=rs.getString("ID");
                                model.insertRow(model.getRowCount(), new Object[] {itemID , rs.getString("DESCRIPTION"), itemQuantity , rs.getDouble("PRIX_UNITE") + " DH", (itemTP[index] = ((double) (Math.round((rs.getDouble("PRIX_UNITE") * itemQuantity)*100 )) /100 ) ) + " DH"});
                                index+=1;
                            }else JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);

                        } catch (SQLException e3) {
                            JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);
                        }



                    }
                    textFieldEnterID.setText(null);
                    textFieldEnterQuantity.setText(null);
                    if(check==1) btnValidatePayment.setEnabled(true);
                    textFieldEnterID.requestFocusInWindow();

                }

            }

        });


        btnAddToTransaction.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                int itemQuantity ;
                if(textFieldEnterQuantity.getText().isEmpty()) itemQuantity=1;

                else itemQuantity = Integer.parseInt(textFieldEnterQuantity.getText());

                String itemID = textFieldEnterID.getText();

                int check = 0;

                if(!itemID.isEmpty()){
                    try {


                        Connection conn = DriverManager.getConnection(url,username,password) ;
                        Statement stmt = conn.createStatement() ;
                        ResultSet rs = stmt.executeQuery("SELECT * from PRODUIT WHERE ID = " + itemID + ";") ;
                        if(rs.next()) {
                            check=1;
                            itemID=rs.getString("ID");
                            model.insertRow(model.getRowCount(), new Object[] {itemID , rs.getString("DESCRIPTION"), itemQuantity , rs.getDouble("PRIX_UNITE") + " DH", (itemTP[index] = ((double) (Math.round((rs.getDouble("PRIX_UNITE") * itemQuantity)*100 )) /100 ) ) + " DH"});
                            index+=1;
                        }else JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);

                    } catch (SQLException e3) {
                        JOptionPane.showMessageDialog(null, "Produit non trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);
                    }



                }
                textFieldEnterID.setText(null);
                textFieldEnterQuantity.setText(null);
                if(check==1) btnValidatePayment.setEnabled(true);
                textFieldEnterID.requestFocusInWindow();

            }

        });



	/*	JLabel labelEmpty = new JLabel("");
		labelEmpty.setPreferredSize(new Dimension(120, 20));
		labelEmpty.setHorizontalAlignment(SwingConstants.RIGHT);
		header.add(labelEmpty);

		JButton btnAddNewItem = new JButton("Ajouter un nouvel item au stock");
		btnAddNewItem.setHorizontalAlignment(SwingConstants.RIGHT);
		header.add(btnAddNewItem);

	*/
        return header;


    }


    public JPanel createFooterBar() {


        JPanel footer = new JPanel(new FlowLayout());

        Checkbox checkPrintReceipt = new Checkbox("Imprimer Re\u00E7u");
        checkPrintReceipt.setState(true);
        checkPrintReceipt.addItemListener(new ItemListener() {

            @Override
            public void itemStateChanged(ItemEvent e) {
                if(e.getStateChange() == ItemEvent.SELECTED) A=true ;
                else A=false;
            }
        });
        checkPrintReceipt.setFont(new Font("Microsoft JhengHei UI Light", Font.PLAIN, 15));

        footer.add(checkPrintReceipt);

        JLabel labelEmpty = new JLabel("");
        labelEmpty.setPreferredSize(new Dimension(90, 20));
        labelEmpty.setHorizontalAlignment(SwingConstants.RIGHT);
        footer.add(labelEmpty);

        Button btnShowHistory = new Button("Afficher l'historique des transactions");
        btnShowHistory.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                setEnabled(false);
                selectedTransactionID=0;
                int transactionID;
                String transactionTime;
                Double transactionPT;

                JFrame frameTransaction = new JFrame();
                frameTransaction.setIconImage(Toolkit.getDefaultToolkit().getImage("C:\\Users\\App groupe\\Downloads\\images\\logo.jpg"));
                frameTransaction.setTitle("Historique des transactions");
                frameTransaction.setResizable(false);
                //	parent.setAlwaysOnTop(true);
                frameTransaction.pack();
                frameTransaction.setVisible(true);
                JPanel p1 = new JPanel();
                p1.setLayout(null);


                frameTransaction.getContentPane().add(lilHeader(),BorderLayout.NORTH);

                frameTransaction.getContentPane().add(p1);
                frameTransaction.setSize(screenSizeWidth*8/10, screenSizeHeight*8/10);
                frameTransaction.setLocationRelativeTo(null);

                JTable tableTransaction = new JTable();
                JScrollPane scrollPaneTransaction = new JScrollPane();
                tableTransaction.setRowHeight(25);

                tableTransaction.setModel(new javax.swing.table.DefaultTableModel(
                        new Object [][] {

                        },
                        new String [] {
                                "Transaction N°", "Date", "Prix total"
                        }

                ) {
                    /**
                     * (
                     */
                    private static final long serialVersionUID = 1L;
                    boolean[] canEdit = new boolean [] {
                            false, false, false
                    };

                    public boolean isCellEditable(int rowIndex, int columnIndex) {
                        return canEdit [columnIndex];
                    }
                });


                modelTransaction = (DefaultTableModel) tableTransaction.getModel();
                tableTransaction.setFont(new Font("Source Code Pro Medium", Font.PLAIN, 16));
                tableTransaction.getTableHeader().setReorderingAllowed(false);
                //   tableTransaction.setEnabled(false);

                scrollPaneTransaction.setViewportView(tableTransaction);
                scrollPaneTransaction.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
                scrollPaneTransaction.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
                frameTransaction.getContentPane().add(scrollPaneTransaction, BorderLayout.CENTER);

                JButton consulterTransaction = new JButton("Consulter");
                consulterTransaction.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent e) {
                        if(selectedTransactionID>1) {

                            String transactionDetailsIDProduit;
                            String transactionDetailsDescriptionProduit;
                            double transactionDetailsPU;
                            double transactionDetailsPT;
                            int transactionDetailsQuantityProduit;

                            setEnabled(false);
                            frameTransaction.setEnabled(false);

                            JFrame frameTransactionDetails = new JFrame();
                            frameTransactionDetails.dispose();
                            frameTransactionDetails.setIconImage(Toolkit.getDefaultToolkit().getImage("C:\\Users\\App groupe\\Downloads\\images\\logo.jpg"));
                            frameTransactionDetails.setTitle("Transaction N° " + selectedTransactionID);
                            frameTransactionDetails.setResizable(false);
                            //	parent.setAlwaysOnTop(true);
                            frameTransactionDetails.pack();
                            frameTransactionDetails.setVisible(true);
                            JPanel p2 = new JPanel();
                            p2.setLayout(null);


                            frameTransactionDetails.getContentPane().add(p2);
                            frameTransactionDetails.setSize(screenSizeWidth*7/10, screenSizeHeight*7/10);
                            frameTransactionDetails.setLocationRelativeTo(null);



                            JTable tableTransactionDetails = new JTable();
                            JScrollPane scrollPaneTransactionDetails = new JScrollPane();
                            tableTransactionDetails.setRowHeight(25);

                            tableTransactionDetails.setModel(new javax.swing.table.DefaultTableModel(
                                    new Object [][] {

                                    },
                                    new String [] {

                                            "ID Produit", "Description", "Quantit\u00E9", "Prix d'unit\u00E9", "Prix total"
                                    }

                            ) {
                                /**
                                 *
                                 */
                                private static final long serialVersionUID = 1L;
                                boolean[] canEdit = new boolean [] {
                                        false, false, false, false, false
                                };

                                public boolean isCellEditable(int rowIndex, int columnIndex) {
                                    return canEdit [columnIndex];
                                }
                            });


                            modelTransactionDetails = (DefaultTableModel) tableTransactionDetails.getModel();
                            tableTransactionDetails.setFont(new Font("Source Code Pro Medium", Font.PLAIN, 16));
                            tableTransactionDetails.getTableHeader().setReorderingAllowed(false);
                            //   tableTransaction.setEnabled(false);

                            scrollPaneTransactionDetails.setViewportView(tableTransactionDetails);
                            scrollPaneTransactionDetails.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
                            scrollPaneTransactionDetails.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
                            frameTransactionDetails.getContentPane().add(scrollPaneTransactionDetails, BorderLayout.CENTER);

                            try {
                                Connection conn = DriverManager.getConnection(url,username,password) ;
                                Statement stmt = conn.createStatement() ;
                                ResultSet rs = stmt.executeQuery("SELECT * from CMD,PRODUIT WHERE ID_TRANSACTION = "+ selectedTransactionID +" AND PRODUIT.ID = ID_PRODUIT ;");

                                while(rs.next()) {
                                    transactionDetailsIDProduit = rs.getString("ID_PRODUIT");
                                    transactionDetailsDescriptionProduit = rs.getString("PRODUIT.DESCRIPTION");
                                    transactionDetailsQuantityProduit = rs.getInt("CMD.QUANTITE");
                                    transactionDetailsPU =  ((double) (Math.round(rs.getDouble("PRIX_UNITE")*100)) / 100);
                                    transactionDetailsPT = ((double) (Math.round(rs.getDouble("PRIX_TOTAL")*100)) / 100);

                                    modelTransactionDetails.insertRow(modelTransactionDetails.getRowCount(), new Object[] {transactionDetailsIDProduit,transactionDetailsDescriptionProduit,transactionDetailsQuantityProduit,transactionDetailsPU,transactionDetailsPT});
                                }

                            }catch(SQLException e2){

                                System.out.println("SELECT TRANSACTION DETAILS ERROR" + e2);

                            }


                            try {
                                Connection conn = DriverManager.getConnection(url,username,password) ;
                                Statement stmt = conn.createStatement() ;
                                ResultSet rs = stmt.executeQuery("SELECT PT,TIME FROM TRANSACTION WHERE ID = "+ selectedTransactionID +" ;");

                                while(rs.next()) {

                                    transactionDetailsFinalPT = ((double) (Math.round(rs.getDouble("PT")*100)) / 100);
                                    transactionDetailsFinalTIME = rs.getString("TIME");

                                }

                            }catch(SQLException e2){

                                System.out.println("SELECT TRANSACTION ERROR" + e2);

                            }

                            JLabel transactionFinalPT = new JLabel("Montant Total Pay\u00E9 :  " + transactionDetailsFinalPT + " DH      |      " + transactionDetailsFinalTIME);
                            transactionFinalPT.setPreferredSize(new Dimension(250, 50));
                            transactionFinalPT.setFont(new Font("Gill Sans MT", Font.BOLD, 18));
                            frameTransactionDetails.getContentPane().add(transactionFinalPT,BorderLayout.SOUTH);

                            WindowListener exitListener = new WindowAdapter() {

                                @Override
                                public void windowClosing(WindowEvent e) {
                                    frameTransaction.setEnabled(true);
                                    textFieldTransactionSearchID.setText(null);

                                    for(int i = modelTransactionDetails.getRowCount()-1; i>=0;i--) {
                                        modelTransactionDetails.removeRow(i);
                                    }
                                }
                            };

                            frameTransactionDetails.addWindowListener(exitListener);
                            textFieldEnterID.requestFocusInWindow();
                        }

                    }


                });
                consulterTransaction.setPreferredSize(new Dimension(200, 45));
                consulterTransaction.setFont(new Font("Copperplate Gothic Bold", Font.BOLD, 16));
                consulterTransaction.setBackground(Color.ORANGE);
                p1.add(consulterTransaction);
                frameTransaction.getContentPane().add(consulterTransaction,BorderLayout.SOUTH);
                WindowListener exitListener = new WindowAdapter() {

                    @Override
                    public void windowClosing(WindowEvent e) {
                        setEnabled(true);
                    }
                };

                frameTransaction.addWindowListener(exitListener);
                textFieldEnterID.requestFocusInWindow();

                //     setEnabled(false);
                try {
                    Connection conn = DriverManager.getConnection(url,username,password) ;
                    Statement stmt = conn.createStatement() ;
                    ResultSet rs = stmt.executeQuery("SELECT * from transaction ORDER BY ID;") ;

                    while(rs.next()) {
                        transactionID = rs.getInt("ID");
                        transactionTime = rs.getString("TIME");
                        transactionPT = ((double) (Math.round(rs.getDouble("PT")*100)) / 100);
                        modelTransaction.insertRow(modelTransaction.getRowCount(), new Object[] {transactionID,transactionTime,transactionPT});
                    }

                }catch(SQLException e2){

                    System.out.println("SELECT TRANSACTION ERROR" + e2);

                }


                tableTransaction.getSelectionModel().addListSelectionListener(new ListSelectionListener() {

                    @Override
                    public void valueChanged(ListSelectionEvent e) {

                        int row =  tableTransaction.convertRowIndexToModel(tableTransaction.getSelectedRow());
                        selectedTransactionID = (Integer) tableTransaction.getModel().getValueAt(row, 0);
                    }
                });



            }
        });

        btnShowHistory.setFont(new Font("Copperplate Gothic Light", Font.BOLD, 16));
        footer.add(btnShowHistory);

        JLabel labelEmpty2 = new JLabel("");
        labelEmpty2.setPreferredSize(new Dimension(80, 20));
        labelEmpty2.setHorizontalAlignment(SwingConstants.RIGHT);
        footer.add(labelEmpty2);

        if(model.getRowCount()!=0 && model.getColumnCount()!=0) {
            btnValidatePayment.setEnabled(true);
        } else btnValidatePayment.setEnabled(false);

        btnValidatePayment.setFont(new Font("Copperplate Gothic Light", Font.BOLD, 16));
        btnValidatePayment.setBackground(Color.GREEN);
        btnValidatePayment.setPreferredSize(new Dimension(170, 45));
        footer.add(btnValidatePayment);
        btnValidatePayment.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                setEnabled(false);
                LocalDateTime TIME = LocalDateTime.now();
                DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String dateTime = TIME.format(myFormatObj);
                //	System.out.println(dateTime);


                try {
                    Connection conn = DriverManager.getConnection(url,username,password) ;
                    Statement stmt = conn.createStatement() ;
                    ResultSet rs = stmt.executeQuery("SELECT ID from transaction;") ;

                    while(rs.next()) {
                        ID = rs.getInt("ID");
                    }

                }catch(SQLException e2){

                    System.out.println("SELECT TRANSACTION ERROR" + e2);

                }

                if(model.getRowCount()!=0 && model.getColumnCount()!=0) {
                    double PT = 0;

                    for(int i = 0; i<model.getRowCount();i++) {
                        PT += itemTP[i];
                    }

                    JFrame parent = new JFrame();
                    parent.setIconImage(Toolkit.getDefaultToolkit().getImage("C:\\Users\\App groupe\\Downloads\\images\\logo.jpg"));
                    parent.setTitle("Detail de la transaction");
                    parent.setResizable(false);
                    //	parent.setAlwaysOnTop(true);
                    parent.pack();
                    parent.setVisible(true);
                    JPanel p1 = new JPanel();
                    p1.setLayout(null);
                    JLabel labelPrixTotal = new JLabel("Prix Total à payer :       "+( (double) (Math.round(PT*100 )) /100 )+ " DH");
                    labelPrixTotal.setBounds(200, 50, 200, 50);
                    p1.add(labelPrixTotal);
                    JLabel labelPrixPaye = new JLabel("Montant pay\u00E9 :       ");
                    labelPrixPaye.setBounds(200, 100, 200, 50);
                    p1.add(labelPrixPaye);
                    textFieldEnterPayedPrice = new JTextField();
                    //			textFieldEnterPayedPrice.setColumns(5);
                    textFieldEnterPayedPrice.setBounds(300, 113, 50, 25);
                    p1.add(textFieldEnterPayedPrice);
                    JButton b = new JButton("Valider et enregistrer la transaction");
                    b.setBounds(150, 250, 360, 40);
                    p1.add(b);
                    parent.getContentPane().add(p1);
                    parent.setSize(screenSizeWidth*6/10, screenSizeHeight*6/10);
                    parent.setLocationRelativeTo(null);
                    validateFinal = 0;

                    WindowListener exitListener = new WindowAdapter() {

                        @Override
                        public void windowClosing(WindowEvent e) {
                            setEnabled(true);
                        }
                    };

                    parent.addWindowListener(exitListener);

                    b.addActionListener(new ActionListener() {
                        @SuppressWarnings("rawtypes")
                        @Override
                        public void actionPerformed(ActionEvent evt) {
                            double PT = 0;
                            double Change;
                            for(int i = 0; i<model.getRowCount();i++) {
                                PT += itemTP[i];
                            }
                            Change = Double.parseDouble(textFieldEnterPayedPrice.getText()) - PT;

                            if(Change<0) {
                                JOptionPane.showMessageDialog(null, "Montant pay\u00E9 saisi est inf\u00E9rieur au prix total. Veuillez verifier l'\u00E9change", "Erreur", JOptionPane.ERROR_MESSAGE);
                                textFieldEnterPayedPrice.setText(null);
                                synchronized (textFieldEnterPayedPrice.getText()) {
                                    textFieldEnterPayedPrice.getText().notify();
                                    Double a = Double.parseDouble(textFieldEnterPayedPrice.getText());
                                    Change = a - PT;
                                }
                            }
                            JOptionPane.showMessageDialog(null, "Change : "+ ( (double) (Math.round(Change*100 )) /100 )+ " DH", "Information", JOptionPane.INFORMATION_MESSAGE);
                            parent.dispose();
                            setEnabled(true);


                            for(int i = 0; i<model.getRowCount();i++) {

                                try {
                                    Connection conn = DriverManager.getConnection(url,username,password) ;
                                    Statement stmt = conn.createStatement() ;
                                    stmt.executeUpdate("INSERT INTO CMD (ID_PRODUIT,QUANTITE,PRIX_TOTAL,ID_TRANSACTION) VALUES (\'" + ((Vector) model.getDataVector().elementAt(i)).elementAt(0) + "\'," + ((Vector) model.getDataVector().elementAt(i)).elementAt(2) + "," + itemTP[i] + "," + (ID+1) + ");") ;
                                    stmt.executeUpdate("UPDATE PRODUIT SET NBR_UNITE = NBR_UNITE - " + ((Vector) model.getDataVector().elementAt(i)).elementAt(2) + " WHERE ID = \'" + ((Vector) model.getDataVector().elementAt(i)).elementAt(0) + "\' ;");
                                }catch(SQLException e2){

                                    System.out.println("Insert CMD ERROR " + e2);

                                }
                            }


                            try {
                                Connection conn = DriverManager.getConnection(url,username,password) ;
                                Statement stmt = conn.createStatement() ;
                                stmt.executeUpdate("INSERT INTO TRANSACTION (ID,TIME,PT) VALUES (" + (ID+1) + "," + "'" + dateTime + "'" + "," + PT + ");") ;
                                caisseSolde += PT;
                            }catch(SQLException e2){

                                JOptionPane.showMessageDialog(null, "Insert TRANSACTION ERROR\n"+ e2,"Erreur", JOptionPane.ERROR_MESSAGE);
                            }


                            if(A) {
                                String QTE = "QTE";
                                String PRODUIT = "PRODUIT";
                                String UNITE = "UNITE";
                                String TOTAL = "TOTAL";
                                int transID = ID+1;
                                String H = "                                  Rebaja Centro\n";
                                H += "\n";
                                H += "Transaction N° " + transID;
                                H += "\n" + dateTime;
                                H += String.format("\n\n%2s  %-30s  %-8s  %s\n",QTE,PRODUIT,UNITE,TOTAL);
                                H += "----------------------------------------------------------------\n";
                                //	System.out.printf("Transaction N° " + transID);
                                //	System.out.printf("\n%2s  %-30s  %-8s  %s\n",QTE,PRODUIT,UNITE,TOTAL);

                                for(int i = 0; i<model.getRowCount();i++) {

                                    //	System.out.printf("%2d    %-30s %-12s %s\n", ((Vector) model.getDataVector().elementAt(i)).elementAt(2), ((Vector) model.getDataVector().elementAt(i)).elementAt(1) ,((Vector) model.getDataVector().elementAt(i)).elementAt(3), ((Vector) model.getDataVector().elementAt(i)).elementAt(4));

                                    H += String.format("%2d    %-30s %-12s %s\n", ((Vector) model.getDataVector().elementAt(i)).elementAt(2), ((Vector) model.getDataVector().elementAt(i)).elementAt(1) ,((Vector) model.getDataVector().elementAt(i)).elementAt(3), ((Vector) model.getDataVector().elementAt(i)).elementAt(4));
                                }
                                H += "----------------------------------------------------------------\n";
                                H += ("Prix total à payer : " + ( (double) (Math.round((PT)*100 )) /100 ) + " DH\n\n");

                                H += "\tMERCI DE VOTRE VISITE";
                                System.out.println(H);
                                //	System.out.println(("Prix total à payer : " + ( (double) (Math.round(PT*100 )) /100 ) + " DH"));
                                textFieldEnterID.requestFocusInWindow();

                                PrinterJob printerJob = PrinterJob.getPrinterJob();
                                JTextPane jTextPane1 = new JTextPane();
                                jTextPane1.setFont(new Font("Arial", Font.BOLD, 8));
                                jTextPane1.setText(H);
                                PageFormat pageFormat = printerJob.defaultPage();
                                Paper paper = new Paper();
                                paper.setSize(80, (double) (paper.getHeight() + model.getRowCount()));
                                paper.setImageableArea(2, 2, paper.getWidth() + 150, paper.getHeight());
                                pageFormat.setPaper(paper);
                                pageFormat.setOrientation(PageFormat.PORTRAIT);
                                printerJob.setPrintable(jTextPane1.getPrintable(null, null), pageFormat);
                                try {
                                    printerJob.print();
                                } catch (PrinterException e) {
                                    // TODO Auto-generated catch block
                                    e.printStackTrace();
                                }

                            }
                            for(int i = model.getRowCount()-1; i>=0;i--) {
                                model.removeRow(i);

                            }



                            btnValidatePayment.setEnabled(false);
                            textFieldEnterID.requestFocusInWindow();
                            index = 0;
                        }
                    });
                    textFieldEnterID.requestFocusInWindow();}


            }

        });


        btnNewTransaction.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                index = 0;
                for(int i = model.getRowCount()-1; i>=0;i--) {
                    model.removeRow(i);
                }
                btnValidatePayment.setEnabled(false);
                textFieldEnterID.requestFocusInWindow();
                index = 0 ;
            }

        });
        btnNewTransaction.setBackground(SystemColor.textHighlight);
        btnNewTransaction.setFont(new Font("Copperplate Gothic Light", Font.BOLD, 16));
        btnNewTransaction.setPreferredSize(new Dimension(200, 45));
        footer.add(btnNewTransaction);

        return footer;
    }

    public JPanel lilHeader() {

        JPanel lil = new JPanel();

        JLabel transactionSearchID = new JLabel("Chercher l'identifiant d'une Transaction ");
        transactionSearchID.setFont(new Font("Microsoft JhengHei UI Light", Font.BOLD, 20));
        lil.add(transactionSearchID);
        JLabel Empty = new JLabel("        ");
        lil.add(Empty);

        textFieldTransactionSearchID = new JTextField();
        textFieldTransactionSearchID.setToolTipText("Entrer l'identifiant de la transaction que vous voulez chercher");
        textFieldTransactionSearchID.setColumns(10);
        lil.add(textFieldTransactionSearchID);
        JButton btnTransactionSearchID = new JButton("Chercher Transaction");
        btnTransactionSearchID.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                try {
                    Connection conn = DriverManager.getConnection(url,username,password) ;
                    Statement stmt = conn.createStatement() ;
                    ResultSet rs = stmt.executeQuery("SELECT ID FROM TRANSACTION WHERE ID = " + Integer.parseInt(textFieldTransactionSearchID.getText()) + " ;");

                    rs.next();
                    selectedTransactionID = rs.getInt("ID");
                    JOptionPane.showMessageDialog(null, selectedTransactionID+"\nIdentifiant trouv\u00E9 ! \nCliquer sur le boutton \"Consulter\" pour continuer","Information", JOptionPane.INFORMATION_MESSAGE);

                }catch(SQLException e2){

                    JOptionPane.showMessageDialog(null, "L'identifiant saisi n'est pas trouv\u00E9\n","Erreur", JOptionPane.ERROR_MESSAGE);

                }

            }

        });

        lil.add(btnTransactionSearchID);

        return lil;
    }


}