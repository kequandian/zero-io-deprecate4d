package com.jfeat.poi.agent.im;

import com.jfeat.poi.agent.POIAgent;
import com.jfeat.poi.agent.im.request.PoiAgentImporterRequest;
import com.jfeat.poi.agent.im.request.TableRelation;
import com.jfeat.poi.agent.im.request.TableTarget;
import com.jfeat.poi.agent.util.TableConvert;
import com.jfeat.poi.api.ImporterParameters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.io.File;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vincenthuang on 19/04/2018.
 */
public class PoiAgentImporterUtil implements POIAgent {

    private static final Logger logger = LoggerFactory.getLogger(PoiAgentImporterUtil.class);

    private File sourceFile;

    private InputStream sourceInputStream;

    private DataSource dataSource;

    public PoiAgentImporterUtil setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        return this;
    }

    @SuppressWarnings("debug only")
    @Deprecated
    public PoiAgentImporterUtil sourceFile(File file){
        this.sourceFile = file;
        return this;
    }

    private int level = 2;
    private boolean header;
    private boolean duplicate;
    private boolean overwrite;
    private List<TableTarget> target;
    private List<TableTarget> unique;
    private List<TableTarget> notnull;
    private List<TableRelation> relation;
    private List<TableConvert> convert;

    public PoiAgentImporterUtil convert(List<TableConvert> convert){
        this.convert = convert;
        return this;
    }
    public PoiAgentImporterUtil convert(TableConvert convert){
        if(this.convert==null){
            this.convert = new ArrayList<>();
        }
        this.convert.add(convert);
        return this;
    }

    public PoiAgentImporterUtil relation(List<TableRelation> relation) {
        this.relation = relation;
        return this;
    }

    public PoiAgentImporterUtil relation(TableRelation relation) {
        if(this.relation==null){
            this.relation = new ArrayList<>();
        }
        this.relation.add(relation);
        return this;
    }

    public PoiAgentImporterUtil target(List<TableTarget> target){
        this.target = target;
        return this;
    }
    public PoiAgentImporterUtil target(String table, List<String> fields){
        if(target==null) {
            target = new ArrayList<>();
        }
        if(!TableTarget.containsTable(target, table)) {
            target.add(new TableTarget(table, fields));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(target, table);
            t.setFields(fields);
        }
        return this;
    }
    public PoiAgentImporterUtil target(String table, String field){
        if(target==null) {
            target = new ArrayList<>();
        }
        if(!TableTarget.containsTable(target, table)) {
            target.add(new TableTarget(table).addField(field));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(target, table);
            t.addField(field);
        }
        return this;
    }

    public PoiAgentImporterUtil data(PoiAgentImporterRequest request) throws SQLException {
        this.level = request.getLevel();
        this.duplicate = request.getDuplicate()==1;
        this.overwrite = request.getOverwrite()==1;
        this.header = request.getHeader()==1;
        this.unique = request.getUnique();
        this.notnull = request.getNotnull();
        this.target = request.getTarget();
        this.relation = request.getRelation();
        this.convert = request.getConvert();

        if(this.target!=null){
            for(TableTarget t : this.target) {
                if(!ImporterParameters.me().canTableImported(t.getTable())){
                    throw new RuntimeException("fatal: table " + t.getTable() + " is not permitted to be imported");
                }
            }
        }

        /// check source file exists
        if(sourceFile==null) {
            sourceFile = new File(request.getSource());
            if (!sourceFile.exists()) {
                throw new RuntimeException("fatal: BAD_REQUEST: excel file not exists " + request.getSource());
            }
        }

        return this;
    }

    public PoiAgentImporterUtil request(PoiAgentImporterRequest request) {
        this.level = request.getLevel();
        this.duplicate = request.getDuplicate()==1;
        this.overwrite = request.getOverwrite()==1;
        this.header = request.getHeader()==1;
        this.unique = request.getUnique();
        this.notnull = request.getNotnull();
        this.target = request.getTarget();
        this.relation = request.getRelation();
        this.convert = request.getConvert();

        if(this.target!=null){
            for(TableTarget t : this.target) {
                if(!ImporterParameters.me().canTableImported(t.getTable())){
                    throw new RuntimeException("fatal: table " + t.getTable() + " is not permitted to be imported");
                }
            }
        }
        return this;
    }

    public int performImport(InputStream inputStream) throws SQLException {
        this.sourceInputStream = inputStream;
        int success = 0;
        if(target==null || target.size()==0){
            return 0;
        }
        Connection connection = dataSource.getConnection();

        if(connection!=null) {

            /// check unique
            if (level == 1) { //单表的情况
                TableTarget t = target.get(0);
                String targetTable = t.getTable();

                PoiAgentImporter importer = new PoiAgentImporter()
                        .overwrite(overwrite)
                        .duplicate(duplicate)
                        .notnull(notnull)
                        .unique(unique)
                        .convert(convert)
                        .target(targetTable, t.getFields());

                /// import to database
                success += importer.importExcel(connection, sourceInputStream, header);

            }
            connection.close();
        }
        return success;

    }

    public int performImport() throws SQLException{
        int success = 0;

        if(target==null || target.size()==0){
            return 0;
        }

        Connection connection = dataSource.getConnection();

        if(connection!=null) {

            /// check unique
            if (level == 1) { //单表的情况
                TableTarget t = target.get(0);
                String targetTable = t.getTable();

                PoiAgentImporter importer = new PoiAgentImporter()
                        .overwrite(overwrite)
                        .duplicate(duplicate)
                        .notnull(notnull)
                        .unique(unique)
                        .convert(convert)
                        .target(targetTable, t.getFields());

                /// import to database
                success += importer.importExcel(connection, sourceFile, header);

            } else if (level == 2) {  //多表，每列不同表

                PoiAgentImporter importer = new PoiAgentImporter()
                        .overwrite(overwrite)
                        .duplicate(duplicate)
                        .notnull(notnull)
                        .unique(unique)
                        .target(target)
                        .convert(convert)
                        .relation(relation);

                /// import to database
                success += importer.importExcel(connection, sourceFile, header);
            }

            connection.close();
        }

        return success;
    }
}
