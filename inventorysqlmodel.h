
#ifndef INVENTORYSQLMODEL_H
#define INVENTORYSQLMODEL_H

#pragma once

#include <QObject>
#include <QSqlQueryModel>

class InventorySqlModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    explicit InventorySqlModel(QObject *parent = nullptr);

    QVariant data(const QModelIndex & index,int role)const;
    QHash<int,QByteArray> roleNames()const{return m_roleNames;}


signals:
public slots:
    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
private:
    void generateRoleNames();
    QHash<int,QByteArray> m_roleNames;
    QSqlDatabase dbase;

signals:

};

#endif // INVENTORYSQLMODEL_H
